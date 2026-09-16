import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/auth/providers/auth_provider.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/widgets/hodi_app_bar.dart';
import '../../../core/widgets/hodi_gradient_button.dart';
import '../../../core/widgets/hodi_text_field.dart';
import '../../../core/widgets/pin_pad.dart';

/// Setting a PIN, or changing one: **prove → choose → confirm.**
///
/// Each of the three earns its place.
///
/// **Prove.** Setting a PIN costs the account password; changing one costs the current PIN. A
/// session on a phone stays open for hours, and somebody holding a borrowed handset must not be
/// able to mint a shorter, lasting way back into an account they only briefly had.
///
/// **Choose.** The server refuses the PINs people actually pick — a repeated digit, a run like 1234
/// — and says which rule was broken rather than "invalid".
///
/// **Confirm.** This is the step that matters most and the one most often skipped. A PIN mistyped
/// once is a PIN somebody cannot sign in with, and they find out at the worst moment, five wrong
/// tries from being locked out of the shortcut entirely.
///
/// A wrong current PIN here counts toward the same five tries the sign-in screen has. That is
/// deliberate: without it this screen is an unlimited "is this PIN right" oracle on an open
/// session, and the server has no such endpoint precisely so that one cannot be built by accident.
class SetPinScreen extends ConsumerStatefulWidget {
  const SetPinScreen({super.key, this.changing = false});

  /// True when a PIN already exists, which changes what proves it.
  final bool changing;

  @override
  ConsumerState<SetPinScreen> createState() => _SetPinScreenState();
}

enum _Step { prove, choose, confirm }

class _SetPinScreenState extends ConsumerState<SetPinScreen> {
  final _passwordController = TextEditingController();
  _Step _step = _Step.prove;
  String _proof = '';
  String _chosen = '';
  String? _error;
  bool _busy = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: HodiAppBar(title: widget.changing ? 'Change PIN' : 'Set a PIN'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
          child: switch (_step) {
            _Step.prove => widget.changing ? _proveWithPin() : _proveWithPassword(),
            _Step.choose => _choose(),
            _Step.confirm => _confirm(),
          },
        ),
      ),
    );
  }

  // ── Prove ───────────────────────────────────────────────────────────────

  Widget _proveWithPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _Heading(
          title: 'First, your password',
          body: 'A PIN is a shorter way into this account, so setting one costs the longer one. '
              'That is what stops a phone left unlocked on a desk from being turned into a '
              'permanent key.',
        ),
        const SizedBox(height: 22),
        HodiTextField(
          controller: _passwordController,
          labelText: 'Password',
          obscureText: true,
          prefixIcon: Icons.lock_outline,
          onSubmitted: (_) => _takePassword(),
        ),
        if (_error != null) ...[
          const SizedBox(height: 10),
          Text(_error!, style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.errorEnd)),
        ],
        const SizedBox(height: 22),
        HodiGradientButton(text: 'Continue', onPressed: _takePassword),
      ],
    );
  }

  void _takePassword() {
    if (_passwordController.text.isEmpty) {
      setState(() => _error = 'Enter your password.');
      return;
    }
    setState(() {
      _proof = _passwordController.text;
      _error = null;
      _step = _Step.choose;
    });
  }

  Widget _proveWithPin() {
    return Column(
      children: [
        const _Heading(
          title: 'Your current PIN',
          body: 'Enter the PIN you use now. Getting it wrong counts toward the same five tries the '
              'sign-in screen has — there is no separate place to test a PIN, on purpose.',
        ),
        const SizedBox(height: 18),
        PinPad(
          busy: _busy,
          error: _error,
          onCompleted: (pin) {
            setState(() {
              _proof = pin;
              _error = null;
              _step = _Step.choose;
            });
          },
        ),
      ],
    );
  }

  // ── Choose, then confirm ────────────────────────────────────────────────

  Widget _choose() {
    return Column(
      children: [
        _Heading(
          title: widget.changing ? 'Choose a new PIN' : 'Choose a PIN',
          body: 'Four digits. Not the same digit repeated, and not a run like 1234 — those two '
              'between them are most of the PINs anybody would guess first.',
        ),
        const SizedBox(height: 18),
        PinPad(
          busy: _busy,
          error: _error,
          onCompleted: (pin) => setState(() {
            _chosen = pin;
            _error = null;
            _step = _Step.confirm;
          }),
        ),
      ],
    );
  }

  Widget _confirm() {
    return Column(
      children: [
        const _Heading(
          title: 'Enter it once more',
          body: 'A PIN typed wrong the first time is one you cannot sign in with, and you would '
              'find that out at the worst possible moment.',
        ),
        const SizedBox(height: 18),
        PinPad(
          busy: _busy,
          error: _error,
          onCompleted: _finish,
          onForgot: _busy
              ? null
              : () => setState(() {
                    _chosen = '';
                    _error = null;
                    _step = _Step.choose;
                  }),
          forgotLabel: 'Choose a different PIN',
        ),
      ],
    );
  }

  Future<void> _finish(String again) async {
    if (again != _chosen) {
      setState(() {
        _error = 'Those did not match. Start the PIN again.';
        _chosen = '';
        _step = _Step.choose;
      });
      return;
    }

    setState(() {
      _busy = true;
      _error = null;
    });

    final repo = ref.read(authRepositoryProvider);
    final response = widget.changing
        ? await repo.changePin(currentPin: _proof, pin: _chosen)
        : await repo.setPin(currentPassword: _proof, pin: _chosen, deviceLabel: _label());

    if (!mounted) return;

    if (response.isSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(widget.changing
            ? 'PIN changed.'
            : 'PIN set. You can use it to sign in on this phone.'),
      ));
      context.pop(true);
      return;
    }

    /*
     * Back to whichever step the server just refused.
     *
     * A rejected PIN — too short, a run, the one already in use — is a choosing problem, and
     * leaving somebody on the confirm step with a message about the digits would ask them to
     * re-enter a PIN that cannot be accepted. A rejected password or current PIN is a proving
     * problem, and sends them to the start.
     */
    final message = response.message;
    final aboutTheProof = message.contains('password') || message.contains('current PIN');
    setState(() {
      _busy = false;
      _error = message.isEmpty ? 'That could not be saved.' : message;
      _chosen = '';
      _step = aboutTheProof ? _Step.prove : _Step.choose;
    });
  }

  /// What this handset is called, for the list of phones on the profile.
  ///
  /// The platform's own words. Something readable beats a device id nobody can match to a phone in
  /// a drawer.
  String _label() => Theme.of(context).platform == TargetPlatform.iOS ? 'iPhone' : 'Android phone';
}

class _Heading extends StatelessWidget {
  const _Heading({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: HodiColors.surfaceLight,
        borderRadius: HodiBorderRadius.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: HodiTextStyles.heading3),
          const SizedBox(height: 6),
          Text(body, style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textMedium)),
        ],
      ),
    );
  }
}
