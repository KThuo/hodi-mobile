import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/auth/providers/auth_provider.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_gradients.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/theme/hodi_shadows.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/widgets/hodi_gradient_button.dart';
import '../../../core/widgets/hodi_text_field.dart';
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

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    final success = await ref.read(authProvider.notifier).login(
          _usernameController.text.trim(),
          _passwordController.text,
        );

    if (success && mounted) {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: HodiGradients.primary),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo area
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: HodiColors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: HodiShadows.card,
                    ),
                    child: const Center(
                      child: Text(
                        'H',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: HodiColors.primaryStart,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'HODI',
                    style: HodiTextStyles.heading1.copyWith(color: HodiColors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Property Management',
                    style: HodiTextStyles.bodyMedium.copyWith(
                      color: HodiColors.white.withValues(alpha: 0.8),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Login card (glassmorphism)
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: HodiColors.white.withValues(alpha: 0.95),
                      borderRadius: HodiBorderRadius.card,
                      boxShadow: HodiShadows.card,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sign In', style: HodiTextStyles.heading2),
                          const SizedBox(height: 8),
                          Text(
                            'Enter your credentials to continue',
                            style: HodiTextStyles.bodyMedium,
                          ),
                          const SizedBox(height: 24),

                          // Error message
                          if (authState.error != null) ...[
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: HodiColors.errorStart.withValues(alpha: 0.1),
                                borderRadius: HodiBorderRadius.small,
                                border: Border.all(
                                  color: HodiColors.errorStart.withValues(alpha: 0.3),
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
                                      style: HodiTextStyles.bodySmall.copyWith(
                                        color: HodiColors.errorStart,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],

                          // Username
                          HodiTextField(
                            controller: _usernameController,
                            hintText: 'Username',
                            prefixIcon: Icons.person_outline,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            validator: (v) => Validators.required(v, 'Username'),
                          ),
                          const SizedBox(height: 16),

                          // Password
                          HodiTextField(
                            controller: _passwordController,
                            hintText: 'Password',
                            prefixIcon: Icons.lock_outline,
                            obscureText: _obscurePassword,
                            textInputAction: TextInputAction.done,
                            onSubmitted: (_) => _handleLogin(),
                            validator: (v) => Validators.required(v, 'Password'),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: HodiColors.textLight,
                                size: 20,
                              ),
                              onPressed: () {
                                setState(() => _obscurePassword = !_obscurePassword);
                              },
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Sign In button
                          HodiGradientButton(
                            text: 'Sign In',
                            onPressed: _handleLogin,
                            isLoading: authState.isLoading,
                          ),
                          const SizedBox(height: 16),

                          // Forgot password
                          Center(
                            child: TextButton(
                              onPressed: () => context.pushNamed('forgot-password'),
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
                  const SizedBox(height: 24),

                  // Vacant houses link
                  TextButton(
                    onPressed: () => context.push('/vacant-houses'),
                    child: Text(
                      'Browse Vacant Houses',
                      style: HodiTextStyles.bodyMedium.copyWith(
                        color: HodiColors.white,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: HodiColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
