import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../auth/providers/auth_provider.dart';
import '../permissions/app_permissions.dart';
import '../theme/hodi_colors.dart';
import '../theme/hodi_shadows.dart';

class _NavTab {
  final String label;
  final IconData icon;
  final IconData activeIcon;
  final String path;
  final int branchIndex;

  const _NavTab({
    required this.label,
    required this.icon,
    required this.activeIcon,
    required this.path,
    required this.branchIndex,
  });
}
class AppShell extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;

  const AppShell({
    super.key,
    required this.navigationShell,
  });

  @override
  ConsumerState<AppShell> createState() => _AppShellState();
}

class _AppShellState extends ConsumerState<AppShell> {
  List<_NavTab> _buildTabs(List<String> authorities) {
    final tabs = <_NavTab>[];

    // Dashboard - always shown for authenticated users
    tabs.add(const _NavTab(
      label: 'Home',
      icon: Icons.dashboard_outlined,
      activeIcon: Icons.dashboard,
      path: '/home',
      branchIndex: 0,
    ));

    bool hasPermission(String p) => authorities.contains(p);
    bool hasAny(List<String> perms) => perms.any((p) => authorities.contains(p));

    // Houses, or My Houses — two endpoints, so two tabs, and never both.
    //
    // Staff read `/units` behind ROLE_HOUSE_VIEW. A tenant's own tenancies are `/occupations`,
    // behind ROLE_TENANT_SELF. One tab offering itself to either authority sent the tenant to a
    // path the server refuses them: the tab appeared, and tapping it showed an error.
    //
    // Somebody who is both a landlord and a tenant holds both authorities and gets the staff
    // list here; their own tenancies are a row in More rather than a sixth tab.
    if (hasPermission(AppPermissions.houseView)) {
      tabs.add(const _NavTab(
        label: 'Houses',
        icon: Icons.home_work_outlined,
        activeIcon: Icons.home_work,
        path: '/houses',
        branchIndex: 1,
      ));
    } else if (hasPermission(AppPermissions.tenantSelf)) {
      tabs.add(const _NavTab(
        label: 'My Houses',
        icon: Icons.holiday_village_outlined,
        activeIcon: Icons.holiday_village,
        path: '/my-houses',
        branchIndex: 5,
      ));
    }

    // Properties
    if (hasPermission(AppPermissions.propertyView)) {
      tabs.add(const _NavTab(
        label: 'Properties',
        icon: Icons.apartment_outlined,
        activeIcon: Icons.apartment,
        path: '/properties',
        branchIndex: 2,
      ));
    }

    // Invoices
    if (hasAny([AppPermissions.invoiceView, AppPermissions.tenantSelf])) {
      tabs.add(const _NavTab(
        label: 'Invoices',
        icon: Icons.receipt_long_outlined,
        activeIcon: Icons.receipt_long,
        path: '/invoices',
        branchIndex: 3,
      ));
    }

    // Payments
    if (hasAny([AppPermissions.paymentView, AppPermissions.tenantSelf])) {
      tabs.add(const _NavTab(
        label: 'Payments',
        icon: Icons.payments_outlined,
        activeIcon: Icons.payments,
        path: '/payments',
        branchIndex: 4,
      ));
    }

    // Enforce max 5 tabs (Material guideline). If more than 4 feature tabs + home,
    // overflow goes to More.
    // We always show More as the last tab, so max 4 feature tabs + More = 5.
    const maxFeatureTabs = 3; // home + 3 features + more = 5
    final featureTabs = tabs.length > 1 ? tabs.sublist(1) : <_NavTab>[];

    final visibleTabs = <_NavTab>[tabs.first]; // Always include Home
    visibleTabs.addAll(featureTabs.take(maxFeatureTabs));

    // Always add More tab
    // Branch 6: /my-houses was added as branch 5, ahead of this one in the router.
    visibleTabs.add(const _NavTab(
      label: 'More',
      icon: Icons.menu_outlined,
      activeIcon: Icons.menu,
      path: '/more',
      branchIndex: 6,
    ));

    return visibleTabs;
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final authorities = authState.user?.authorities ?? [];
    final tabs = _buildTabs(authorities);

    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: HodiColors.white,
          boxShadow: HodiShadows.bottomNav,
        ),
        child: SafeArea(
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(tabs.length, (index) {
                final tab = tabs[index];
                final isSelected = widget.navigationShell.currentIndex == tab.branchIndex;

                return Expanded(
                  child: InkWell(
                    onTap: () => widget.navigationShell.goBranch(
                      tab.branchIndex,
                      initialLocation: tab.branchIndex == widget.navigationShell.currentIndex,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          isSelected ? tab.activeIcon : tab.icon,
                          color: isSelected
                              ? HodiColors.primaryStart
                              : HodiColors.textLight,
                          size: 24,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          tab.label,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                            color: isSelected
                                ? HodiColors.primaryStart
                                : HodiColors.textLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
