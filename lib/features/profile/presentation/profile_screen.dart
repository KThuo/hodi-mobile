import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/auth/providers/auth_provider.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_shadows.dart';
import '../../../core/theme/hodi_gradients.dart';
import '../../../core/widgets/hodi_app_bar.dart';
import '../../../core/widgets/hodi_status_badge.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../domain/profile_model.dart';
import '../providers/profile_providers.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileProvider);

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: const HodiAppBar(title: 'My Profile'),
      body: profileAsync.when(
        data: (profile) {
          if (profile == null) {
            return const HodiErrorState(message: 'Profile not found');
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _ProfileHeaderCard(profile: profile),
                const SizedBox(height: 16),
                _AccountDetailsCard(profile: profile),
                const SizedBox(height: 16),
                _DeleteAccountCard(
                  onDelete: () => _showDeleteAccountDialog(context, ref),
                ),
              ],
            ),
          );
        },
        loading: () => const HodiLoadingShimmer(itemCount: 2, itemHeight: 160),
        error: (e, _) => HodiErrorState(
          message: e is Exception
              ? e.toString().replaceFirst('Exception: ', '')
              : 'Failed to load profile',
          onRetry: () => ref.invalidate(profileProvider),
        ),
      ),
    );
  }

  void _showDeleteAccountDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => _DeleteAccountDialog(ref: ref),
    );
  }
}

// --- Gradient Header ---

class _ProfileHeaderCard extends StatelessWidget {
  final ProfileModel profile;

  const _ProfileHeaderCard({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: HodiGradients.primary,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.card,
      ),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: HodiColors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                profile.initials,
                style: HodiTextStyles.heading2.copyWith(
                  color: HodiColors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            profile.fullNames ?? 'User',
            style: HodiTextStyles.heading2.copyWith(color: HodiColors.white),
            textAlign: TextAlign.center,
          ),
          if (profile.usertype != null) ...[
            const SizedBox(height: 10),
            HodiStatusBadge(
              text: profile.usertype!,
              type: BadgeType.info,
            ),
          ],
        ],
      ),
    );
  }
}

// --- Account Details Card ---

class _AccountDetailsCard extends StatelessWidget {
  final ProfileModel profile;

  const _AccountDetailsCard({required this.profile});

  @override
  Widget build(BuildContext context) {
    final isTenant = profile.usertype?.toLowerCase() == 'tenant';
    final isSuperadmin = profile.usertype?.toLowerCase() == 'superadmin';
    final showEstate = !isTenant && !isSuperadmin;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: HodiColors.primaryStart.withValues(alpha: 0.1),
                  borderRadius: HodiBorderRadius.small,
                ),
                child: Icon(Icons.person_outline, color: HodiColors.primaryStart, size: 18),
              ),
              const SizedBox(width: 10),
              Text('Account Details', style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: HodiColors.divider),
          const SizedBox(height: 16),
          _DetailRow(icon: Icons.person_outline, label: 'Full Name', value: profile.fullNames ?? 'N/A'),
          _DetailRow(icon: Icons.email_outlined, label: 'Email', value: profile.email ?? 'N/A'),
          _DetailRow(icon: Icons.phone_outlined, label: 'Phone', value: profile.phone ?? 'N/A'),
          _DetailRow(icon: Icons.group_outlined, label: 'User Group', value: profile.userGroup ?? 'N/A'),
          _DetailRow(icon: Icons.badge_outlined, label: 'User Type', value: profile.usertype ?? 'N/A'),
          if (showEstate)
            _DetailRow(icon: Icons.domain_outlined, label: 'Estate', value: profile.estate ?? 'N/A'),
          _DetailRow(
            icon: Icons.calendar_today_outlined,
            label: 'Password Expiry',
            value: profile.passwordExpiry ?? 'N/A',
            isLast: true,
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isLast;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: HodiColors.textLight),
          const SizedBox(width: 10),
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: HodiTextStyles.label.copyWith(
                color: HodiColors.textLight,
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: HodiTextStyles.bodyMedium.copyWith(
                color: HodiColors.textDark,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Delete Account Card ---

class _DeleteAccountCard extends StatelessWidget {
  final VoidCallback onDelete;

  const _DeleteAccountCard({required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: HodiColors.errorStart.withValues(alpha: 0.1),
                  borderRadius: HodiBorderRadius.small,
                ),
                child: const Icon(Icons.warning_amber_outlined, color: HodiColors.errorStart, size: 18),
              ),
              const SizedBox(width: 10),
              Text('Danger Zone', style: HodiTextStyles.heading3.copyWith(fontSize: 16, color: HodiColors.errorStart)),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: HodiColors.divider),
          const SizedBox(height: 16),
          Text(
            'Permanently delete your account and all associated data. This action cannot be undone.',
            style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textMedium),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: onDelete,
              icon: const Icon(Icons.delete_forever_outlined, size: 18),
              label: const Text('Delete Account'),
              style: OutlinedButton.styleFrom(
                foregroundColor: HodiColors.errorStart,
                side: const BorderSide(color: HodiColors.errorStart),
                shape: RoundedRectangleBorder(borderRadius: HodiBorderRadius.small),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Delete Account Dialog ---

class _DeleteAccountDialog extends StatefulWidget {
  final WidgetRef ref;

  const _DeleteAccountDialog({required this.ref});

  @override
  State<_DeleteAccountDialog> createState() => _DeleteAccountDialogState();
}

class _DeleteAccountDialogState extends State<_DeleteAccountDialog> {
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;
  String? _error;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleDelete() async {
    final password = _passwordController.text.trim();
    if (password.isEmpty) {
      setState(() => _error = 'Please enter your password');
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    final user = widget.ref.read(authProvider).user;
    if (user == null) {
      setState(() {
        _isLoading = false;
        _error = 'User not found. Please re-login.';
      });
      return;
    }

    final repo = widget.ref.read(authRepositoryProvider);
    final response = await repo.deleteAccount(user.username, password);

    if (!mounted) return;

    if (response.isSuccess) {
      Navigator.of(context).pop();
      await widget.ref.read(authProvider.notifier).disableBiometric();
      widget.ref.read(authProvider.notifier).logout();
    } else {
      setState(() {
        _isLoading = false;
        _error = response.message.isNotEmpty ? response.message : 'Failed to delete account';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: HodiBorderRadius.card),
      title: Row(
        children: [
          const Icon(Icons.warning_amber_rounded, color: HodiColors.errorStart, size: 24),
          const SizedBox(width: 8),
          Text('Delete Account', style: HodiTextStyles.heading3.copyWith(color: HodiColors.errorStart)),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'This will permanently delete your account. Enter your password to confirm.',
            style: HodiTextStyles.bodyMedium.copyWith(color: HodiColors.textMedium),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            enabled: !_isLoading,
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
              border: OutlineInputBorder(borderRadius: HodiBorderRadius.small),
              enabledBorder: OutlineInputBorder(
                borderRadius: HodiBorderRadius.small,
                borderSide: const BorderSide(color: HodiColors.divider),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: HodiBorderRadius.small,
                borderSide: const BorderSide(color: HodiColors.errorStart),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  size: 20,
                  color: HodiColors.textLight,
                ),
                onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
              ),
            ),
            style: HodiTextStyles.bodyMedium,
          ),
          if (_error != null) ...[
            const SizedBox(height: 8),
            Text(
              _error!,
              style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.errorStart),
            ),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
          child: Text(
            'Cancel',
            style: HodiTextStyles.bodyMedium.copyWith(color: HodiColors.textMedium),
          ),
        ),
        TextButton(
          onPressed: _isLoading ? null : _handleDelete,
          child: _isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2, color: HodiColors.errorStart),
                )
              : Text(
                  'Delete',
                  style: HodiTextStyles.bodyMedium.copyWith(
                    color: HodiColors.errorStart,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ],
    );
  }
}
