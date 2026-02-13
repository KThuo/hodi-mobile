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

class _MenuItem {
  final String label;
  final IconData icon;
  final List<String>? permissions;
  final String? route;
  final bool isDestructive;

  const _MenuItem({
    required this.label,
    required this.icon,
    this.permissions,
    this.route,
    this.isDestructive = false,
  });
}

const _moduleItems = <_MenuItem>[
  _MenuItem(
    label: 'Properties',
    icon: Icons.apartment,
    permissions: [AppPermissions.propertiesView],
    route: '/properties',
  ),
  _MenuItem(
    label: 'Houses',
    icon: Icons.home_work,
    permissions: [AppPermissions.housesView, AppPermissions.tenantAccessView],
    route: '/houses',
  ),
  _MenuItem(
    label: 'Tenants',
    icon: Icons.people,
    permissions: [AppPermissions.tenantsView],
    route: '/more/tenants',
  ),
  _MenuItem(
    label: 'Invoices',
    icon: Icons.receipt_long,
    permissions: [AppPermissions.invoicesGenerate, AppPermissions.tenantAccessView],
    route: '/invoices',
  ),
  _MenuItem(
    label: 'Payments',
    icon: Icons.payments,
    permissions: [AppPermissions.paymentsNew, AppPermissions.tenantAccessView],
    route: '/payments',
  ),
  _MenuItem(
    label: 'Metres',
    icon: Icons.speed,
    permissions: [AppPermissions.metresView],
    route: '/more/metres',
  ),
  _MenuItem(
    label: 'Vacate Notices',
    icon: Icons.description,
    permissions: [AppPermissions.tenantsView],
    route: '/more/vacate-notices',
  ),
];

const _accountItems = <_MenuItem>[
  _MenuItem(
    label: 'Profile',
    icon: Icons.person,
    route: '/more/profile',
  ),
  _MenuItem(
    label: 'About',
    icon: Icons.info_outline,
  ),
  _MenuItem(
    label: 'Logout',
    icon: Icons.logout,
    isDestructive: true,
  ),
];

class MoreScreen extends ConsumerWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              decoration: const BoxDecoration(
                gradient: HodiGradients.primary,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Menu',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: HodiColors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'All features & settings',
                    style: GoogleFonts.poppins(
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
              child: _MenuSection(
                title: 'Account',
                children: _accountItems.map((item) {
                  if (item.isDestructive) {
                    return _MenuRow(
                      item: item,
                      onTap: () => _confirmLogout(context, ref),
                    );
                  }
                  if (item.label == 'About') {
                    return _MenuRow(
                      item: item,
                      onTap: () => _showAboutInfo(context),
                    );
                  }
                  return _MenuRow(
                    item: item,
                    onTap: () => context.go(item.route!),
                  );
                }).toList(),
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
                color: item.isDestructive
                    ? HodiColors.errorStart.withValues(alpha: 0.1)
                    : HodiColors.primaryStart.withValues(alpha: 0.1),
                borderRadius: HodiBorderRadius.small,
              ),
              child: Icon(
                item.icon,
                size: 20,
                color: item.isDestructive
                    ? HodiColors.errorStart
                    : HodiColors.primaryStart,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                item.label,
                style: HodiTextStyles.bodyLarge.copyWith(
                  color: item.isDestructive
                      ? HodiColors.errorStart
                      : HodiColors.textDark,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (!item.isDestructive)
              const Icon(
                Icons.chevron_right,
                size: 20,
                color: HodiColors.textLight,
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
