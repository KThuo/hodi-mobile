import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../core/auth/providers/auth_provider.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_gradients.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/widgets/hodi_gradient_button.dart';
import '../../../core/widgets/hodi_text_field.dart';
import '../../../core/widgets/pin_pad.dart';
import '../../../core/utils/validators.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _biometricTriggered = false;

  /*
   * Who signed in here last, and whether this handset holds a PIN for them.
   *
   * Null while the keystore is being read — not false. A first frame drawn from a guess would show
   * the password field and then swap it for a keypad, which is the sort of flicker somebody reads
   * as the app not knowing what it is doing.
   */
  String? _remembered;
  bool _pinSet = false;
  bool _readStorage = false;

  /// Set when the person chooses the password over the PIN, or the server says the PIN is spent.
  bool _passwordInstead = false;

  String? _pinError;

  @override
  void initState() {
    super.initState();
    _readRemembered();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _tryBiometricAuth();
    });
  }

  Future<void> _readRemembered() async {
    final repo = ref.read(authRepositoryProvider);
    final username = await repo.rememberedUsername();
    final pinSet = await repo.isPinSet();
    if (!mounted) return;
    setState(() {
      _remembered = username;
      _pinSet = pinSet && username != null && username.isNotEmpty;
      _readStorage = true;
      if (username != null) _usernameController.text = username;
    });
  }

  /// Whether the keypad is what this screen should be showing.
  bool get _askingForPin => _readStorage && _pinSet && !_passwordInstead;

  Future<void> _submitPin(String pin) async {
    setState(() => _pinError = null);
    final result = await ref.read(authProvider.notifier).loginWithPin(pin);
    if (!mounted) return;

    if (result.signedIn) {
      context.go('/home');
      return;
    }

    /*
     * Three outcomes, not two.
     *
     * "Wrong digits" means try again. "No PIN on this phone" and "switched off after too many
     * tries" both mean this handset cannot offer a PIN any more — so the keypad goes away rather
     * than leaving somebody tapping at something that can never work.
     */
    setState(() {
      _pinError = result.message;
      if (result.usePasswordInstead) {
        _pinSet = false;
        _passwordInstead = true;
      }
    });
  }

  /// "Not you?" — forgets the name and the PIN flag, and asks from scratch.
  Future<void> _forgetMe() async {
    await ref.read(authRepositoryProvider).forgetUsername();
    if (!mounted) return;
    setState(() {
      _remembered = null;
      _pinSet = false;
      _passwordInstead = false;
      _pinError = null;
      _usernameController.clear();
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _tryBiometricAuth() {
    if (_biometricTriggered) return;
    final authState = ref.read(authProvider);
    if (authState.pendingBiometricVerification) {
      _biometricTriggered = true;
      _handleBiometricLogin();
    }
  }

  Future<void> _handleBiometricLogin() async {
    final success = await ref
        .read(authProvider.notifier)
        .authenticateWithBiometrics();
    if (success && mounted) {
      context.go('/home');
    }
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    final username = _usernameController.text.trim();
    final password = _passwordController.text;

    final success = await ref
        .read(authProvider.notifier)
        .login(username, password);

    if (success && mounted) {
      /*
       * The offer that used to be here asked whether to "enable biometric login", and accepting it
       * stored the password in plain text to replay later. It is gone with the storage.
       *
       * What is worth offering instead is the PIN, which is a credential the server holds — and the
       * place to offer it is the profile, beside the fingerprint switch, rather than in a dialog
       * thrown at somebody the moment they have finished signing in.
       */
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          /*
           * The photograph, clean.
           *
           * It used to sit at 35% over a full-screen brand gradient, so the first thing anybody saw
           * on opening the app was a blue-into-magenta wash with a washed-out room behind it. The
           * web shows the same `login-bg.png` at full strength with no tint at all, and its own note
           * says why it settled there: "a full-frame scrim washed it out and a colour tint hazed it
           * pink — the old page showed the photograph clean and that was the better call."
           */
          Positioned.fill(
            child: Image.asset('assets/images/login-bg.png', fit: BoxFit.cover),
          ),

          // Darkened at the foot only, and only as far as the link down there needs to be legible.
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    HodiColors.inkDeep.withValues(alpha: 0.55),
                  ],
                  stops: const [0.0, 0.55, 1.0],
                ),
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // The card: glass over the photograph, as the web's AuthShell is.
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            // --glass and --glass-edge. Not flat white: the blur behind it is what
                            // makes a card on a photograph read as glass rather than as a sticker.
                            color: HodiColors.white.withValues(alpha: 0.95),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: HodiColors.white.withValues(alpha: 0.4),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x38071726),
                                blurRadius: 40,
                                offset: Offset(0, 20),
                              ),
                              BoxShadow(
                                color: Color(0x1F000000),
                                blurRadius: 24,
                                offset: Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // The mark lives in the card, in its own colours. Outside it, tinted
                                // white, it needed a gradient behind it to be visible at all.
                                Center(
                                  child: SvgPicture.asset(
                                    'assets/images/logo.svg',
                                    height: 52,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                // The heading carries the brand, and it is the only place on this screen
                                // that does — gradient-clipped text, exactly as `.login__title` is.
                                ShaderMask(
                                  shaderCallback: (bounds) =>
                                      HodiGradients.primary.createShader(
                                        Rect.fromLTWH(
                                          0,
                                          0,
                                          bounds.width,
                                          bounds.height,
                                        ),
                                      ),
                                  blendMode: BlendMode.srcIn,
                                  child: Text(
                                    'Welcome Back',
                                    style: HodiTextStyles.heading2.copyWith(
                                      color: HodiColors.white,
                                      letterSpacing: -0.5,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                // Says who is being asked, once this phone knows. A keypad with no
                                // name on it is four dots and no way to tell whose account they open.
                                Text(
                                  _askingForPin
                                      ? 'Enter your PIN, ${_remembered ?? ''}'.trimRight()
                                      : 'Sign in to your account',
                                  style: HodiTextStyles.bodyMedium.copyWith(
                                    color: HodiColors.textMedium,
                                  ),
                                ),
                                const SizedBox(height: 24),

                                // Error message
                                if (authState.error != null) ...[
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: HodiColors.errorStart.withValues(
                                        alpha: 0.1,
                                      ),
                                      borderRadius: HodiBorderRadius.small,
                                      border: Border.all(
                                        color: HodiColors.errorStart.withValues(
                                          alpha: 0.3,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.error_outline,
                                          color: HodiColors.errorStart,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            authState.error!,
                                            style: HodiTextStyles.bodySmall
                                                .copyWith(
                                                  color: HodiColors.errorStart,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                ],

                                // ── The PIN, where this handset holds one ──────
                                if (_askingForPin) ...[
                                  PinPad(
                                    busy: authState.isLoading,
                                    error: _pinError,
                                    onCompleted: _submitPin,
                                    onForgot: () =>
                                        setState(() => _passwordInstead = true),
                                  ),
                                  const SizedBox(height: 4),
                                  Center(
                                    child: TextButton(
                                      onPressed: _forgetMe,
                                      child: Text(
                                        'Not ${_remembered ?? 'you'}?',
                                        style: HodiTextStyles.bodySmall.copyWith(
                                          color: HodiColors.textLight,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],

                                // Username
                                if (!_askingForPin) HodiTextField(
                                  controller: _usernameController,
                                  hintText: 'Username',
                                  prefixIcon: Icons.person_outline,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  validator: (v) =>
                                      Validators.required(v, 'Username'),
                                ),
                                if (!_askingForPin) const SizedBox(height: 16),

                                // Password
                                if (!_askingForPin) HodiTextField(
                                  controller: _passwordController,
                                  hintText: 'Password',
                                  prefixIcon: Icons.lock_outline,
                                  obscureText: _obscurePassword,
                                  textInputAction: TextInputAction.done,
                                  onSubmitted: (_) => _handleLogin(),
                                  validator: (v) =>
                                      Validators.required(v, 'Password'),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscurePassword
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      color: HodiColors.textLight,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      setState(
                                        () => _obscurePassword =
                                            !_obscurePassword,
                                      );
                                    },
                                  ),
                                ),
                                if (!_askingForPin) const SizedBox(height: 24),

                                // Sign In button
                                if (!_askingForPin) HodiGradientButton(
                                  text: 'Sign In',
                                  onPressed: _handleLogin,
                                  isLoading: authState.isLoading,
                                ),

                                // Biometric button
                                if (authState.biometricEnabled && !_askingForPin) ...[
                                  const SizedBox(height: 16),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 48,
                                    child: OutlinedButton.icon(
                                      onPressed: authState.isLoading
                                          ? null
                                          : _handleBiometricLogin,
                                      icon: const Icon(
                                        Icons.fingerprint,
                                        size: 22,
                                      ),
                                      label: Text(
                                        'Sign in with Biometrics',
                                        style: HodiTextStyles.bodyMedium
                                            .copyWith(
                                              color: HodiColors.primaryStart,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor:
                                            HodiColors.primaryStart,
                                        side: BorderSide(
                                          color: HodiColors.primaryStart,
                                          width: 1.5,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                                const SizedBox(height: 16),

                                // Forgot password
                                Center(
                                  child: TextButton(
                                    onPressed: () =>
                                        context.pushNamed('forgot-password'),
                                    child: Text(
                                      'Forgot Password?',
                                      style: HodiTextStyles.bodyMedium.copyWith(
                                        color: HodiColors.primaryStart,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    /*
                     * The two public surfaces, in the same place the web puts them.
                     *
                     * Somewhere to rent and somewhere to stay are different questions with
                     * different answers, and the one link that used to be here answered only the
                     * first. Neither needs an account — which is the point: somebody looking for a
                     * place to live does not have one yet, and asking them to sign up before they
                     * can look is asking in the wrong order.
                     */
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _PublicLink(
                          label: 'To Let',
                          onTap: () => context.push('/vacant-houses'),
                        ),
                        Container(
                          width: 1,
                          height: 14,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          color: HodiColors.white.withValues(alpha: 0.4),
                        ),
                        _PublicLink(
                          label: 'Stays',
                          onTap: () => context.push('/stays'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


/// One of the two public links under the sign-in card.
class _PublicLink extends StatelessWidget {
  const _PublicLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        label,
        style: HodiTextStyles.bodyMedium.copyWith(
          color: HodiColors.white,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.underline,
          decorationColor: HodiColors.white,
        ),
      ),
    );
  }
}
