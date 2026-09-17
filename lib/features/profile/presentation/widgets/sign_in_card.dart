import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/auth/providers/auth_provider.dart';
import '../../../../core/theme/hodi_border_radius.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_shadows.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/widgets/hodi_text_field.dart';

/// How this person gets back in — the two switches, which are not the same kind of thing.
///
/// **A PIN is a credential.** The server holds it, hashed, in a row naming this handset. Only the
/// account password can create that row, which is what makes four digits defensible: somebody with
/// a username and the login URL reaches no hash to guess against.
///
/// **A fingerprint is not.** It produces no credential and the server has never heard of it. What
/// the prompt proves is that the person holding the phone is the person the phone belongs to, and
/// what it guards is the refresh token already sitting in this phone's keystore. So it is a
/// question about *this* phone, which no other phone can inherit an answer to — and it stays here.
///
/// That distinction is why only one of them costs a password to change.
class SignInCard extends ConsumerStatefulWidget {
  const SignInCard({super.key});

  @override
  ConsumerState<SignInCard> createState() => _SignInCardState();
}

class _SignInCardState extends ConsumerState<SignInCard> {
  bool _pinSet = false;
  bool _loading = true;
  /// A removal in flight, so the row cannot be asked twice while the first is still going.
  bool _removing = false;

  @override
  void initState() {
    super.initState();
    _readPinState();
  }

  /// From the server, not from what this app remembers.
  ///
  /// A PIN can be removed from another phone, or spend its five wrong tries — and an app trusting
  /// its own memory would go on offering a keypad that cannot work.
  Future<void> _readPinState() async {
    final response = await ref.read(authRepositoryProvider).me();
    if (!mounted) return;
    setState(() {
      _pinSet = response.data?.pinSet ?? false;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Signing in', style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
          const SizedBox(height: 4),
          Text(
            'Both of these are about this phone only.',
            style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
          ),
          const SizedBox(height: 14),
          const Divider(height: 1),

          // ── The PIN ───────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Row(
              children: [
                _Icon(icon: Icons.pin_outlined, on: _pinSet),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('PIN', style: HodiTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.w600,
                        color: HodiColors.textDark,
                      )),
                      const SizedBox(height: 2),
                      Text(
                        _loading
                            ? 'Checking…'
                            : _pinSet
                                ? 'Four digits instead of your password, on this phone.'
                                : 'Sign in with four digits instead of your password.',
                        style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (!_loading)
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () async {
                      final done = await context.push<bool>(
                        '/more/profile/pin',
                        extra: _pinSet,
                      );
                      if (done == true) _readPinState();
                    },
                    child: Text(_pinSet ? 'Change PIN' : 'Set a PIN'),
                  ),
                ),
                if (_pinSet) ...[
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _removing ? null : _confirmRemove,
                      style: OutlinedButton.styleFrom(foregroundColor: HodiColors.errorEnd),
                      child: const Text('Remove'),
                    ),
                  ),
                ],
              ],
            ),

          const SizedBox(height: 6),
          const Divider(height: 1),

          // ── The fingerprint ───────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Row(
              children: [
                _Icon(icon: Icons.fingerprint, on: auth.biometricEnabled),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Fingerprint or face', style: HodiTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.w600,
                        color: HodiColors.textDark,
                      )),
                      const SizedBox(height: 2),
                      Text(
                        auth.biometricAvailable
                            ? 'Ask for it before picking up a session left open on this phone.'
                            : 'This phone has no fingerprint or face reader set up.',
                        style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: auth.biometricEnabled,
                  onChanged: auth.biometricAvailable ? _toggleBiometrics : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _toggleBiometrics(bool on) async {
    if (!on) {
      await ref.read(authProvider.notifier).disableBiometric();
      return;
    }
    // Turning it on costs a successful prompt. A switch that claims a protection the reader cannot
    // actually provide is worse than not offering the switch.
    final result = await ref.read(authProvider.notifier).enableBiometric();
    if (!mounted || result.proved || result.message == null) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result.message!)));
  }

  /// Removing costs the password, because the person doing this has usually forgotten the PIN.
  ///
  /// The removal reaches the server: `POST /auth/pin/remove` deletes the row this handset's PIN
  /// lives in, or every row on the account when "from every phone" is ticked — which is the only
  /// way to reach a handset that is no longer in their hand.
  Future<void> _confirmRemove() async {
    final controller = TextEditingController();
    var everywhere = false;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: HodiBorderRadius.card),
          title: Text('Remove your PIN', style: HodiTextStyles.heading3),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You will sign in with your password again. Your password is what confirms this, '
                'not the PIN — that is usually the thing somebody has forgotten.',
                style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textMedium),
              ),
              const SizedBox(height: 14),
              HodiTextField(
                controller: controller,
                labelText: 'Password',
                obscureText: true,
                prefixIcon: Icons.lock_outline,
                // So the Remove action can enable itself. Without it the button stayed live with
                // an empty field, the dialog closed on a tap, and nothing happened or was said —
                // which reads exactly like a PIN that cannot be removed.
                onChanged: (_) => setDialogState(() {}),
              ),
              const SizedBox(height: 6),
              CheckboxListTile(
                value: everywhere,
                onChanged: (v) => setDialogState(() => everywhere = v ?? false),
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                title: Text('From every phone', style: HodiTextStyles.bodyMedium),
                // The only way to reach a handset that is no longer in their hand.
                subtitle: Text(
                  'For a phone you no longer have.',
                  style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => context.pop(false), child: const Text('Cancel')),
            TextButton(
              // Dead until there is a password to send, rather than closing on nothing.
              onPressed:
                  controller.text.isEmpty ? null : () => context.pop(true),
              style: TextButton.styleFrom(foregroundColor: HodiColors.errorEnd),
              child: const Text('Remove'),
            ),
          ],
        ),
      ),
    );

    final password = controller.text;
    controller.dispose();
    if (confirmed != true || password.isEmpty) return;

    setState(() => _removing = true);
    final response = await ref.read(authRepositoryProvider).removePin(
          currentPassword: password,
          everywhere: everywhere,
        );
    if (!mounted) return;
    setState(() => _removing = false);

    // Always says something. The server's own sentence on a refusal — "That is not your current
    // password" — and its confirmation on success; the fallback is only for a reply with neither.
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(response.message.isNotEmpty
          ? response.message
          : response.isSuccess
              ? 'PIN removed.'
              : 'That PIN could not be removed.'),
      backgroundColor:
          response.isSuccess ? HodiColors.successStart : HodiColors.errorStart,
    ));
    if (response.isSuccess) _readPinState();
  }
}

class _Icon extends StatelessWidget {
  const _Icon({required this.icon, required this.on});

  final IconData icon;
  final bool on;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: on ? HodiColors.successBg : HodiColors.surfaceInset,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, size: 20, color: on ? HodiColors.successEnd : HodiColors.textLight),
    );
  }
}
