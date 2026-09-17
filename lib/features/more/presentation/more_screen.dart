import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../core/auth/providers/auth_provider.dart';
import '../../../core/permissions/app_permissions.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_gradients.dart';
import '../../../core/theme/hodi_shadows.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../notifications/providers/notification_providers.dart';

class _MenuItem {
  final String label;
  final IconData icon;
  final List<String>? permissions;
  final String? route;
  const _MenuItem({
    required this.label,
    required this.icon,
    this.permissions,
    this.route,
  });
}

const _moduleItems = <_MenuItem>[
  _MenuItem(
    label: 'Properties',
    icon: Icons.apartment,
    permissions: [AppPermissions.propertyView],
    route: '/properties',
  ),
  // Two rows, not one, because they are two endpoints.
  //
  // Staff read the estate's units from `/units`, which requires ROLE_HOUSE_VIEW. A tenant's own
  // tenancies are `/occupations`, which accepts ROLE_TENANT_SELF. One row offering itself to
  // both sent the tenant to a path the server refuses them — the menu showed the door and the
  // door was locked.
  _MenuItem(
    label: 'Houses',
    icon: Icons.home_work,
    permissions: [AppPermissions.houseView],
    route: '/houses',
  ),
  _MenuItem(
    label: 'My Houses',
    icon: Icons.holiday_village,
    permissions: [AppPermissions.tenantSelf],
    route: '/my-houses',
  ),
  _MenuItem(
    label: 'Tenants',
    icon: Icons.people,
    permissions: [AppPermissions.tenantView],
    route: '/more/tenants',
  ),
  _MenuItem(
    label: 'Invoices',
    icon: Icons.receipt_long,
    permissions: [AppPermissions.invoiceView, AppPermissions.tenantSelf],
    route: '/invoices',
  ),
  _MenuItem(
    label: 'Payments',
    icon: Icons.payments,
    permissions: [AppPermissions.paymentView, AppPermissions.tenantSelf],
    route: '/payments',
  ),
  _MenuItem(
    label: 'Metres',
    icon: Icons.speed,
    permissions: [AppPermissions.metreView],
    route: '/more/metres',
  ),
  // Both audiences hold ROLE_MAINT_VIEW, so this row is offered on the authority itself rather
  // than on being staff — which is the point of the module being in the app.
  _MenuItem(
    label: 'Repairs',
    icon: Icons.build_outlined,
    permissions: [AppPermissions.maintView],
    route: '/more/maintenance',
  ),
  // A tenant holds VIEW and DECIDE here; a gate holds NEW. Either is reason to show the row.
  _MenuItem(
    label: 'Visitors',
    icon: Icons.meeting_room_outlined,
    permissions: [AppPermissions.visitView],
    route: '/more/visitors',
  ),
  _MenuItem(
    label: 'Expenses',
    icon: Icons.account_balance_wallet_outlined,
    permissions: [AppPermissions.expenseView],
    route: '/more/expenses',
  ),
  _MenuItem(
    label: 'Tenancy Report',
    icon: Icons.fact_check_outlined,
    permissions: [AppPermissions.reportView],
    route: '/more/reports',
  ),
  // Staff only. `GET /leases` needs ROLE_LEASE_VIEW, and there is no tenant-facing *list* of
  // agreements — only `/leases/mine/{occupationId}`, one at a time. A tenant reaches theirs from
  // My Houses, where the tenancy it belongs to already is. Offering this row on tenantSelf would
  // be the Houses mistake again: a door that opens onto a refusal.
  _MenuItem(
    label: 'Agreements',
    icon: Icons.description_outlined,
    permissions: [AppPermissions.leaseView],
    route: '/more/agreements',
  ),
  _MenuItem(
    label: 'Penalties',
    icon: Icons.gavel_outlined,
    permissions: [AppPermissions.penaltyView],
    route: '/more/penalties',
  ),
  _MenuItem(
    label: 'Vacate Notices',
    icon: Icons.description,
    permissions: [AppPermissions.tenantView],
    route: '/more/vacate-notices',
  ),
];

class MoreScreen extends ConsumerStatefulWidget {
  const MoreScreen({super.key});

  @override
  ConsumerState<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends ConsumerState<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final user = authState.user;

    final visibleModules = _moduleItems.where((item) {
      if (item.permissions == null) return true;
      return user?.hasAnyPermission(item.permissions!) ?? false;
    }).toList();

    return Scaffold(
      backgroundColor: HodiColors.background,
      body: CustomScrollView(
        slivers: [
          // Gradient header
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 16,
                left: 20,
                right: 20,
                bottom: 24,
              ),
              decoration: BoxDecoration(
                gradient: HodiGradients.primary,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Menu',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: HodiColors.white,
                        ),
                      ),
                      const Spacer(),
                      // In the header rather than as a menu row: a bell that has to be scrolled
                      // to is a bell nobody looks at, and the count is the only thing on this
                      // screen that changes on its own.
                      const _NotificationBell(),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'All features & settings',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      color: HodiColors.white.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          // Modules section
          if (visibleModules.isNotEmpty)
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: _MenuSection(
                  title: 'Modules',
                  children: visibleModules
                      .map((item) => _MenuRow(
                            item: item,
                            onTap: () => context.go(item.route!),
                          ))
                      .toList(),
                ),
              ),
            ),

          const SliverToBoxAdapter(child: SizedBox(height: 12)),

          // Account section
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: _AccountSection(
                biometricAvailable: authState.biometricAvailable,
                biometricEnabled: authState.biometricEnabled,
                onBiometricToggle: (enabled) =>
                    _handleBiometricToggle(enabled),
                onProfileTap: () => context.go('/more/profile'),
                onAboutTap: () => _showAboutInfo(context),
                onPrivacyTap: () => context.push('/more/privacy'),
                onTermsTap: () => context.push('/more/terms'),
                onLogoutTap: () => _confirmLogout(context, ref),
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          // App version footer
          SliverToBoxAdapter(
            child: FutureBuilder<PackageInfo>(
              future: PackageInfo.fromPlatform(),
              builder: (context, snapshot) {
                final version = snapshot.data?.version ?? '...';
                final buildNumber = snapshot.data?.buildNumber ?? '';
                return Center(
                  child: Text(
                    'Hodi v$version${buildNumber.isNotEmpty ? ' ($buildNumber)' : ''}',
                    style: HodiTextStyles.bodySmall,
                  ),
                );
              },
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }

  /// Both switches live on the profile now; this is the quick one, kept where it was.
  ///
  /// It no longer asks for a password. It used to, because enabling "biometric login" meant storing
  /// the password to replay later — the fingerprint proves the holder and guards the session that
  /// is already here, and nothing about that needs a credential.
  Future<void> _handleBiometricToggle(bool enable) async {
    if (!enable) {
      await ref.read(authProvider.notifier).disableBiometric();
      return;
    }
    final result = await ref.read(authProvider.notifier).enableBiometric();
    if (!mounted || result.proved || result.message == null) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result.message!)));
  }


  void _confirmLogout(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: HodiBorderRadius.card),
        title: Text('Logout', style: HodiTextStyles.heading3),
        content: Text(
          'Are you sure you want to logout?',
          style: HodiTextStyles.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Cancel',
              style: HodiTextStyles.bodyMedium.copyWith(
                color: HodiColors.textMedium,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(authProvider.notifier).logout();
            },
            child: Text(
              'Logout',
              style: HodiTextStyles.bodyMedium.copyWith(
                color: HodiColors.errorStart,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAboutInfo(BuildContext context) async {
    final info = await PackageInfo.fromPlatform();
    if (!context.mounted) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: HodiBorderRadius.card),
        title: Text('About Hodi', style: HodiTextStyles.heading3),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Property management made simple.',
              style: HodiTextStyles.bodyMedium,
            ),
            const SizedBox(height: 12),
            Text(
              'Version ${info.version} (${info.buildNumber})',
              style: HodiTextStyles.bodySmall,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'OK',
              style: HodiTextStyles.bodyMedium.copyWith(
                color: HodiColors.primaryStart,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AccountSection extends StatelessWidget {
  final bool biometricAvailable;
  final bool biometricEnabled;
  final ValueChanged<bool> onBiometricToggle;
  final VoidCallback onProfileTap;
  final VoidCallback onAboutTap;
  final VoidCallback onPrivacyTap;
  final VoidCallback onTermsTap;
  final VoidCallback onLogoutTap;

  const _AccountSection({
    required this.biometricAvailable,
    required this.biometricEnabled,
    required this.onBiometricToggle,
    required this.onProfileTap,
    required this.onAboutTap,
    required this.onPrivacyTap,
    required this.onTermsTap,
    required this.onLogoutTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            'ACCOUNT',
            style: HodiTextStyles.label.copyWith(
              letterSpacing: 1.2,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: HodiColors.cardBackground,
            borderRadius: HodiBorderRadius.card,
            boxShadow: HodiShadows.cardLight,
          ),
          child: Column(
            children: [
              // Profile
              _AccountRow(
                icon: Icons.person,
                label: 'Profile',
                onTap: onProfileTap,
                isFirst: true,
              ),
              const Divider(height: 1, indent: 56, color: HodiColors.divider),

              // Biometric toggle (only if device supports it)
              if (biometricAvailable) ...[
                _BiometricToggleRow(
                  enabled: biometricEnabled,
                  onToggle: onBiometricToggle,
                ),
                const Divider(
                    height: 1, indent: 56, color: HodiColors.divider),
              ],

              // About
              _AccountRow(
                icon: Icons.info_outline,
                label: 'About',
                onTap: onAboutTap,
              ),
              const Divider(height: 1, indent: 56, color: HodiColors.divider),

              // Reachable from inside the app, which is what the stores ask for — and more to the
              // point, what somebody wants at the moment they think to look.
              _AccountRow(
                icon: Icons.privacy_tip_outlined,
                label: 'Privacy Policy',
                onTap: onPrivacyTap,
              ),
              const Divider(height: 1, indent: 56, color: HodiColors.divider),
              _AccountRow(
                icon: Icons.gavel_outlined,
                label: 'Terms & Conditions',
                onTap: onTermsTap,
              ),
              const Divider(height: 1, indent: 56, color: HodiColors.divider),

              // Logout
              _AccountRow(
                icon: Icons.logout,
                label: 'Logout',
                onTap: onLogoutTap,
                isDestructive: true,
                isLast: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AccountRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isDestructive;
  final bool isFirst;
  final bool isLast;

  const _AccountRow({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isDestructive = false,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.vertical(
        top: isFirst
            ? const Radius.circular(HodiBorderRadius.cardValue)
            : Radius.zero,
        bottom: isLast
            ? const Radius.circular(HodiBorderRadius.cardValue)
            : Radius.zero,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: isDestructive
                    ? HodiColors.errorStart.withValues(alpha: 0.1)
                    : HodiColors.primaryStart.withValues(alpha: 0.1),
                borderRadius: HodiBorderRadius.small,
              ),
              child: Icon(
                icon,
                size: 20,
                color: isDestructive
                    ? HodiColors.errorStart
                    : HodiColors.primaryStart,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: HodiTextStyles.bodyLarge.copyWith(
                  color: isDestructive
                      ? HodiColors.errorStart
                      : HodiColors.textDark,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BiometricToggleRow extends StatelessWidget {
  final bool enabled;
  final ValueChanged<bool> onToggle;

  const _BiometricToggleRow({
    required this.enabled,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: HodiColors.primaryStart.withValues(alpha: 0.1),
              borderRadius: HodiBorderRadius.small,
            ),
            child: Icon(
              Icons.fingerprint,
              size: 20,
              color: HodiColors.primaryStart,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Biometric Login',
              style: HodiTextStyles.bodyLarge.copyWith(
                color: HodiColors.textDark,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Switch.adaptive(
            value: enabled,
            onChanged: onToggle,
            activeTrackColor: HodiColors.primaryStart,
          ),
        ],
      ),
    );
  }
}

class _MenuSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _MenuSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            title.toUpperCase(),
            style: HodiTextStyles.label.copyWith(
              letterSpacing: 1.2,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: HodiColors.cardBackground,
            borderRadius: HodiBorderRadius.card,
            boxShadow: HodiShadows.cardLight,
          ),
          child: Column(
            children: [
              for (int i = 0; i < children.length; i++) ...[
                children[i],
                if (i < children.length - 1)
                  const Divider(
                    height: 1,
                    indent: 56,
                    color: HodiColors.divider,
                  ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _MenuRow extends StatelessWidget {
  final _MenuItem item;
  final VoidCallback onTap;

  const _MenuRow({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isFirst = _isFirst(context);
    final isLast = _isLast(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.vertical(
        top: isFirst ? const Radius.circular(HodiBorderRadius.cardValue) : Radius.zero,
        bottom: isLast ? const Radius.circular(HodiBorderRadius.cardValue) : Radius.zero,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: HodiColors.primaryStart.withValues(alpha: 0.1),
                borderRadius: HodiBorderRadius.small,
              ),
              child: Icon(
                item.icon,
                size: 20,
                color: HodiColors.primaryStart,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                item.label,
                style: HodiTextStyles.bodyLarge.copyWith(
                  color: HodiColors.textDark,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isFirst(BuildContext context) {
    final column = context.findAncestorWidgetOfExactType<Column>();
    if (column == null) return false;
    final nonDividerChildren = column.children.whereType<_MenuRow>().toList();
    return nonDividerChildren.isNotEmpty && nonDividerChildren.first.item.label == item.label;
  }

  bool _isLast(BuildContext context) {
    final column = context.findAncestorWidgetOfExactType<Column>();
    if (column == null) return false;
    final nonDividerChildren = column.children.whereType<_MenuRow>().toList();
    return nonDividerChildren.isNotEmpty && nonDividerChildren.last.item.label == item.label;
  }
}


/// The bell, with what is waiting behind it.
///
/// The count comes from `/notifications/unread-count`, which exists because every screen wants the
/// number and none of them want twenty rows to get it. Nothing polls: it is read when this screen
/// builds, which is the moment somebody is looking at it.
class _NotificationBell extends ConsumerWidget {
  const _NotificationBell();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Zero while it loads and zero if it fails — a bell that cannot say how many is still a bell,
    // and a badge that flickers a number in on arrival is worse than one that appears with it.
    final unread = ref.watch(unreadCountProvider).value ?? 0;

    return Semantics(
      label: unread == 0
          ? 'Notifications'
          : 'Notifications, $unread unread',
      button: true,
      child: IconButton(
        onPressed: () => context.push('/more/notifications'),
        icon: Stack(
          clipBehavior: Clip.none,
          children: [
            const Icon(Icons.notifications_none, color: HodiColors.white, size: 26),
            if (unread > 0)
              Positioned(
                right: -3,
                top: -3,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                  constraints: const BoxConstraints(minWidth: 18),
                  decoration: BoxDecoration(
                    color: HodiColors.errorStart,
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(color: HodiColors.white, width: 1.5),
                  ),
                  child: Text(
                    // Past ninety-nine the exact number stops being information.
                    unread > 99 ? '99+' : '$unread',
                    textAlign: TextAlign.center,
                    style: HodiTextStyles.bodySmall.copyWith(
                      color: HodiColors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      height: 1.3,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
