import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/auth/data/auth_repository.dart';
import '../../../core/auth/providers/auth_provider.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/widgets/hodi_app_bar.dart';
import '../../../core/widgets/hodi_gradient_button.dart';
import '../../../core/widgets/hodi_text_field.dart';

/// The rules the server will enforce, fetched so the screen can state them.
///
/// A screen that lists rules it invented disagrees with the server the first time either changes,
/// and the person retyping their password is who finds out. Null while it is being asked for, and
/// null if the ask fails — in which case nothing is claimed, and the server's own message on a
/// rejection is what explains the refusal.
final passwordPolicyProvider = FutureProvider.autoDispose<PasswordPolicy?>((ref) async {
  final response = await ref.watch(authRepositoryProvider).passwordPolicy();
  return response.isSuccess ? response.data : null;
});

/// Changing the account password.
///
/// Two ways in, and they are not the same screen.
///
/// **Chosen**, from the profile: there is a way back, and cancelling leaves the password alone.
/// **Forced**, when the server answers `004`: there is no way back, because there is nowhere to go
/// — every other call is refused until the password changes. The app used to have neither, so an
/// account flagged this way signed in, saw a generic error on whatever screen was open, and had no
/// route out of it. Signing out and in again did not help.
class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  ConsumerState<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  final _currentController = TextEditingController();
  final _newController = TextEditingController();
  final _confirmController = TextEditingController();

  bool _showCurrent = false;
  bool _showNew = false;
  bool _busy = false;
  String? _error;

  @override
  void dispose() {
    _currentController.dispose();
    _newController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  bool get _forced => ref.read(authProvider).mustChangePassword;

  Future<void> _submit() async {
    final current = _currentController.text;
    final next = _newController.text;
    final confirm = _confirmController.text;

    // Checked here as well as on the server. The server compares them too and answers on the
    // confirmPassword field, but catching it before the request saves a round trip on the
    // mistake people make most.
    if (current.isEmpty || next.isEmpty || confirm.isEmpty) {
      setState(() => _error = 'Fill in all three fields.');
      return;
    }
    if (next != confirm) {
      setState(() => _error = 'The new password and its confirmation do not match.');
      return;
    }
    if (next == current) {
      setState(() => _error = 'The new password must be different from the current one.');
      return;
    }

    setState(() {
      _busy = true;
      _error = null;
    });

    final response = await ref.read(authProvider.notifier).changePassword(
          currentPassword: current,
          newPassword: next,
          confirmPassword: confirm,
        );

    if (!mounted) return;

    if (!response.isSuccess) {
      setState(() {
        _busy = false;
        // The server's own words. It knows which rule was broken — reused, too short, too like
        // the last one — and restating that here in general terms would lose which.
        _error = response.message.isNotEmpty
            ? response.message
            : 'That password could not be changed.';
      });
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          response.message.isNotEmpty
              ? response.message
              : 'Your password has been changed.',
        ),
      ),
    );

    // Forced: the router is holding the app here and lets go as soon as the flag clears, so
    // there is nothing to pop. Chosen: back to the profile.
    if (!_forced && context.canPop()) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final forced = ref.watch(authProvider).mustChangePassword;
    final policy = ref.watch(passwordPolicyProvider).value;

    return PopScope(
      // Nothing to go back to while the flag is set: every other screen's data is refused.
      canPop: !forced,
      child: Scaffold(
        backgroundColor: HodiColors.background,
        appBar: HodiAppBar(
          title: 'Change Password',
          showBackButton: !forced,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (forced) ...[
                  _ForcedNotice(),
                  const SizedBox(height: 20),
                ],

                HodiTextField(
                  controller: _currentController,
                  labelText: 'Current password',
                  obscureText: !_showCurrent,
                  textInputAction: TextInputAction.next,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showCurrent ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      size: 20,
                      color: HodiColors.textLight,
                    ),
                    onPressed: () => setState(() => _showCurrent = !_showCurrent),
                  ),
                ),
                const SizedBox(height: 14),
                HodiTextField(
                  controller: _newController,
                  labelText: 'New password',
                  obscureText: !_showNew,
                  textInputAction: TextInputAction.next,
                  onChanged: (_) => setState(() {}),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showNew ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      size: 20,
                      color: HodiColors.textLight,
                    ),
                    onPressed: () => setState(() => _showNew = !_showNew),
                  ),
                ),
                const SizedBox(height: 14),
                HodiTextField(
                  controller: _confirmController,
                  labelText: 'Confirm new password',
                  // Deliberately not revealable. Confirming is the step that catches a typo, and
                  // a confirmation somebody can read back is a confirmation they copy by eye.
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  onChanged: (_) => setState(() {}),
                  onSubmitted: (_) => _busy ? null : _submit(),
                ),

                if (policy != null) ...[
                  const SizedBox(height: 18),
                  _PolicyCard(policy: policy, candidate: _newController.text),
                ],

                if (_error != null) ...[
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: HodiColors.errorStart.withValues(alpha: 0.08),
                      borderRadius: HodiBorderRadius.small,
                      border: Border.all(
                        color: HodiColors.errorStart.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.error_outline, size: 18, color: HodiColors.errorStart),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            _error!,
                            style: HodiTextStyles.bodySmall
                                .copyWith(color: HodiColors.errorStart),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],

                const SizedBox(height: 24),
                HodiGradientButton(
                  text: 'Change password',
                  isLoading: _busy,
                  onPressed: _busy ? null : _submit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ForcedNotice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: HodiColors.warningStart.withValues(alpha: 0.1),
        borderRadius: HodiBorderRadius.card,
        border: Border.all(color: HodiColors.warningStart.withValues(alpha: 0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.lock_reset_outlined, color: HodiColors.warningStart, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Set a new password to continue',
                  style: HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  'This account was given a temporary password. Nothing else will load until it '
                  'is changed.',
                  style: HodiTextStyles.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// The server's rules, ticked off as they are met.
///
/// Length is the one rule this can check honestly, because it is a number the server sent. The
/// rest are shown as the server worded them and left unticked — guessing at a regular expression
/// to tick them would be the client inventing the rules again, one step removed.
class _PolicyCard extends StatelessWidget {
  final PasswordPolicy policy;
  final String candidate;

  const _PolicyCard({required this.policy, required this.candidate});

  @override
  Widget build(BuildContext context) {
    final longEnough = candidate.length >= policy.minLength;
    final notTooLong = candidate.isEmpty || candidate.length <= policy.maxLength;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: HodiColors.surfaceLight,
        borderRadius: HodiBorderRadius.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your password must',
            style: HodiTextStyles.label.copyWith(color: HodiColors.textMedium),
          ),
          const SizedBox(height: 10),
          _Rule(
            text: 'be at least ${policy.minLength} characters',
            met: candidate.isEmpty ? null : longEnough,
          ),
          if (!notTooLong)
            _Rule(text: 'be at most ${policy.maxLength} characters', met: false),
          for (final rule in policy.rules) _Rule(text: rule, met: null),
          if (policy.historyDepth > 0)
            _Rule(
              text: 'not be one of your last ${policy.historyDepth}',
              met: null,
            ),
        ],
      ),
    );
  }
}

class _Rule extends StatelessWidget {
  final String text;

  /// Null where the rule cannot be checked here — shown as a bullet rather than a tick or a
  /// cross, because a grey cross reads as a failure nobody has been told about.
  final bool? met;

  const _Rule({required this.text, required this.met});

  @override
  Widget build(BuildContext context) {
    final (icon, colour) = switch (met) {
      true => (Icons.check_circle, HodiColors.successStart),
      false => (Icons.cancel_outlined, HodiColors.errorStart),
      null => (Icons.circle_outlined, HodiColors.textLight),
    };

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 15, color: colour),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: HodiTextStyles.bodySmall.copyWith(
                color: met == false ? HodiColors.errorStart : HodiColors.textMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
