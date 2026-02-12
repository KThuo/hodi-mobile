import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../auth/providers/auth_provider.dart';
import 'app_shell.dart';
import 'route_names.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/houses/presentation/houses_screen.dart';
import '../../features/houses/presentation/house_detail_screen.dart';
import '../../features/invoices/presentation/invoices_screen.dart';
import '../../features/invoices/presentation/invoice_detail_screen.dart';
import '../../features/payments/presentation/payments_screen.dart';
import '../../features/payments/presentation/payment_detail_screen.dart';

// Placeholder screens - will be replaced in later phases
class _PlaceholderScreen extends StatelessWidget {
  final String title;
  const _PlaceholderScreen({required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(title, style: const TextStyle(fontSize: 18))),
    );
  }
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isAuthenticated = authState.isAuthenticated;
      final isAuthRoute = state.matchedLocation == '/login' ||
          state.matchedLocation == '/forgot-password';
      final isPublicRoute = state.matchedLocation.startsWith('/vacant-houses');

      if (!isAuthenticated && !isAuthRoute && !isPublicRoute) {
        return '/login';
      }

      if (isAuthenticated && isAuthRoute) {
        return '/home';
      }

      return null;
    },
    routes: [
      // Auth routes (no shell)
      GoRoute(
        path: '/login',
        name: RouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        name: RouteNames.forgotPassword,
        builder: (context, state) => const _PlaceholderScreen(title: 'Forgot Password'),
      ),

      // Public routes (no shell)
      GoRoute(
        path: '/vacant-houses',
        name: RouteNames.vacantHouses,
        builder: (context, state) => const _PlaceholderScreen(title: 'Vacant Houses'),
        routes: [
          GoRoute(
            path: ':id',
            name: RouteNames.vacantHouseDetail,
            builder: (context, state) => const _PlaceholderScreen(title: 'Vacant House Detail'),
          ),
        ],
      ),

      // Main shell routes
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppShell(navigationShell: navigationShell);
        },
        branches: [
          // Home / Dashboard
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: RouteNames.home,
                builder: (context, state) => const DashboardScreen(),
              ),
            ],
          ),

          // Houses
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/houses',
                name: RouteNames.houses,
                builder: (context, state) => const HousesScreen(),
                routes: [
                  GoRoute(
                    path: ':id',
                    name: RouteNames.houseDetail,
                    builder: (context, state) {
                      final id = int.tryParse(state.pathParameters['id'] ?? '') ?? 0;
                      return HouseDetailScreen(houseId: id);
                    },
                  ),
                ],
              ),
            ],
          ),

          // Properties (placeholder - Phase 3)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/properties',
                name: RouteNames.properties,
                builder: (context, state) => const _PlaceholderScreen(title: 'Properties'),
                routes: [
                  GoRoute(
                    path: ':id/houses',
                    name: RouteNames.propertyHouses,
                    builder: (context, state) => const _PlaceholderScreen(title: 'Property Houses'),
                  ),
                ],
              ),
            ],
          ),

          // Invoices
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/invoices',
                name: RouteNames.invoices,
                builder: (context, state) => const InvoicesScreen(),
                routes: [
                  GoRoute(
                    path: ':rrn',
                    name: RouteNames.invoiceDetail,
                    builder: (context, state) {
                      final rrn = state.pathParameters['rrn'] ?? '';
                      return InvoiceDetailScreen(rrn: rrn);
                    },
                  ),
                ],
              ),
            ],
          ),

          // Payments
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/payments',
                name: RouteNames.payments,
                builder: (context, state) => const PaymentsScreen(),
                routes: [
                  GoRoute(
                    path: ':rrn',
                    name: RouteNames.paymentDetail,
                    builder: (context, state) {
                      final rrn = state.pathParameters['rrn'] ?? '';
                      return PaymentDetailScreen(rrn: rrn);
                    },
                  ),
                ],
              ),
            ],
          ),

          // More
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/more',
                name: RouteNames.more,
                builder: (context, state) => const _PlaceholderScreen(title: 'More'),
                routes: [
                  GoRoute(
                    path: 'metres',
                    name: RouteNames.metres,
                    builder: (context, state) => const _PlaceholderScreen(title: 'Metres'),
                  ),
                  GoRoute(
                    path: 'vacate-notices',
                    name: RouteNames.vacateNotices,
                    builder: (context, state) => const _PlaceholderScreen(title: 'Vacate Notices'),
                  ),
                  GoRoute(
                    path: 'profile',
                    name: RouteNames.profile,
                    builder: (context, state) => const _PlaceholderScreen(title: 'Profile'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
