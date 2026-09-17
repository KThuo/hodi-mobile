import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../api/api_constants.dart';
import '../auth/providers/auth_provider.dart';
import 'app_shell.dart';
import 'route_names.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/forgot_password_screen.dart';
import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/houses/presentation/houses_screen.dart';
import '../../features/houses/presentation/house_detail_screen.dart';
import '../../features/invoices/presentation/invoices_screen.dart';
import '../../features/invoices/presentation/invoice_detail_screen.dart';
import '../../features/payments/presentation/payments_screen.dart';
import '../../features/payments/presentation/payment_detail_screen.dart';
import '../../features/properties/presentation/properties_screen.dart';
import '../../features/properties/presentation/property_detail_screen.dart';
import '../../features/more/presentation/more_screen.dart';
import '../../features/notifications/presentation/notifications_screen.dart';
import '../../core/widgets/hodi_webview_page.dart';
import '../../features/visitors/presentation/visitors_screen.dart';
import '../../features/expenses/presentation/expenses_screen.dart';
import '../../features/reports/presentation/reports_screen.dart';
import '../../features/leases/presentation/leases_screen.dart';
import '../../features/leases/presentation/lease_detail_screen.dart';
import '../../features/maintenance/presentation/maintenance_screen.dart';
import '../../features/maintenance/presentation/maintenance_detail_screen.dart';
import '../../features/tenants/presentation/tenants_screen.dart';
import '../../features/tenants/presentation/tenant_detail_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/profile/presentation/set_pin_screen.dart';
import '../../features/profile/presentation/change_password_screen.dart';
import '../../features/stays/presentation/stays_screen.dart';
import '../../features/stays/presentation/stay_detail_screen.dart';
import '../../features/metres/presentation/metres_screen.dart';
import '../../features/metres/presentation/metre_history_screen.dart';
import '../../features/vacant_houses/presentation/vacant_houses_screen.dart';
import '../../features/vacant_houses/presentation/vacant_house_detail_screen.dart';
import '../../features/vacate_notices/presentation/vacate_notices_screen.dart';
import '../../features/occupations/domain/occupation_model.dart';
import '../../features/occupations/presentation/my_houses_screen.dart';
import '../../features/occupations/presentation/occupation_detail_screen.dart';
import '../../features/auth/presentation/splash_screen.dart';
import '../../features/vacate_notices/presentation/vacate_notice_detail_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/home',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      // Nothing is decided until the keystore has answered. Sending somebody to /login while the
      // question is still open is what made a live session flash the wrong screen on every start.
      if (authState.restoring) {
        return state.matchedLocation == '/splash' ? null : '/splash';
      }
      if (state.matchedLocation == '/splash') {
        return authState.isAuthenticated ? '/home' : '/login';
      }

      final isAuthenticated = authState.isAuthenticated;
      final isAuthRoute = state.matchedLocation == '/login' ||
          state.matchedLocation == '/forgot-password';
      // The two public browse surfaces: somewhere to rent, and somewhere to stay. Neither needs an
      // account, because somebody looking for one does not have an account yet.
      final isPublicRoute = state.matchedLocation.startsWith('/vacant-houses') ||
          state.matchedLocation.startsWith('/stays');

      if (!isAuthenticated && !isAuthRoute && !isPublicRoute) {
        return '/login';
      }

      if (isAuthenticated && isAuthRoute) {
        return '/home';
      }

      /*
       * A password the server will not let anybody past.
       *
       * Held here rather than shown as a message, because the refusal is not about one screen —
       * every call answers `004` until the password changes, so whatever somebody navigates to
       * renders an error. The old behaviour was exactly that: a generic failure on an arbitrary
       * screen, with no way forward and no way out, and signing out and back in reproduced it.
       */
      if (isAuthenticated &&
          authState.mustChangePassword &&
          state.matchedLocation != '/change-password') {
        return '/change-password';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),

      // Auth routes (no shell)
      GoRoute(
        path: '/login',
        name: RouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        name: RouteNames.forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),

      // Outside the shell on purpose. While the password must change there is nowhere else to
      // go, and a bottom bar offering five tabs that all fail is an invitation to try them.
      GoRoute(
        path: '/change-password',
        name: RouteNames.changePassword,
        builder: (context, state) => const ChangePasswordScreen(),
      ),

      // Public routes (no shell)
      GoRoute(
        path: '/stays',
        name: RouteNames.stays,
        builder: (context, state) => const StaysScreen(),
        routes: [
          GoRoute(
            path: ':id',
            name: RouteNames.stayDetail,
            // A public token, not a HashId — passed back exactly as the list row carried it.
            builder: (context, state) =>
                StayDetailScreen(id: state.pathParameters['id'] ?? ''),
          ),
        ],
      ),
      GoRoute(
        path: '/vacant-houses',
        name: RouteNames.vacantHouses,
        builder: (context, state) => const VacantHousesScreen(),
        routes: [
          GoRoute(
            path: ':id',
            name: RouteNames.vacantHouseDetail,
            builder: (context, state) {
              final id = state.pathParameters['id'] ?? '';
              return VacantHouseDetailScreen(houseId: id);
            },
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
                      // A HashId, passed through as the server sent it. Parsing it as an integer
                      // turned every real id into 0 and every unit page into "not found".
                      final id = state.pathParameters['id'] ?? '';
                      return HouseDetailScreen(houseId: id);
                    },
                  ),
                ],
              ),
            ],
          ),

          // Properties
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/properties',
                name: RouteNames.properties,
                builder: (context, state) => const PropertiesScreen(),
                routes: [
                  GoRoute(
                    path: ':id',
                    name: RouteNames.propertyDetail,
                    builder: (context, state) {
                      final id = state.pathParameters['id'] ?? '';
                      return PropertyDetailScreen(propertyId: id);
                    },
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

          // My houses — a tenant's own tenancies.
          //
          // Its own branch rather than a variant of /houses, because the two read different
          // endpoints under different authorities and a shared branch would have to decide which
          // at build time. Branch 6, after More, so the existing indices do not shift.
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/my-houses',
                name: RouteNames.myHouses,
                builder: (context, state) => const MyHousesScreen(),
                routes: [
                  GoRoute(
                    path: ':id',
                    name: RouteNames.myHouseDetail,
                    builder: (context, state) {
                      // The row travels in `extra`; there is no GET /occupations/{id} to fetch it
                      // back from, so a cold link renders from the balance read alone.
                      final id = state.pathParameters['id'] ?? '';
                      final row = state.extra;
                      return OccupationDetailScreen(
                        occupationId: id,
                        occupation: row is OccupationModel ? row : null,
                      );
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
                builder: (context, state) => const MoreScreen(),
                routes: [
                  GoRoute(
                    path: 'tenants',
                    name: RouteNames.tenants,
                    builder: (context, state) => const TenantsScreen(),
                    routes: [
                      GoRoute(
                        path: ':userId/details',
                        name: RouteNames.tenantDetail,
                        builder: (context, state) {
                          final userId = state.pathParameters['userId'] ?? '';
                          return TenantDetailScreen(userId: userId);
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'metres',
                    name: RouteNames.metres,
                    builder: (context, state) => const MetresScreen(),
                    routes: [
                      GoRoute(
                        path: ':id/history',
                        name: RouteNames.metreHistory,
                        builder: (context, state) {
                          final id = state.pathParameters['id'] ?? '';
                          return MetreHistoryScreen(metreId: id);
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'vacate-notices',
                    name: RouteNames.vacateNotices,
                    builder: (context, state) => const VacateNoticesScreen(),
                    routes: [
                      GoRoute(
                        path: ':id',
                        name: RouteNames.vacateNoticeDetail,
                        builder: (context, state) {
                          final id = state.pathParameters['id'] ?? '';
                          return VacateNoticeDetailScreen(noticeId: id);
                        },
                      ),
                    ],
                  ),
                  // The policy and the terms, opened from the site that owns them. In the shell so
                  // the bottom bar stays put: somebody checking what they agreed to is not leaving
                  // the app, and a full-screen push with only a back button reads as though they
                  // have.
                  GoRoute(
                    path: 'privacy',
                    name: RouteNames.privacyPolicy,
                    builder: (context, state) => const HodiWebviewPage(
                      title: 'Privacy Policy',
                      url: ApiConstants.privacyPolicyUrl,
                    ),
                  ),
                  GoRoute(
                    path: 'terms',
                    name: RouteNames.termsAndConditions,
                    builder: (context, state) => const HodiWebviewPage(
                      title: 'Terms & Conditions',
                      url: ApiConstants.termsUrl,
                    ),
                  ),
                  GoRoute(
                    path: 'agreements',
                    name: RouteNames.leases,
                    builder: (context, state) => const LeasesScreen(),
                    routes: [
                      GoRoute(
                        path: ':id',
                        name: RouteNames.leaseDetail,
                        builder: (context, state) => LeaseDetailScreen(
                          id: state.pathParameters['id'] ?? '',
                        ),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'reports',
                    name: RouteNames.reports,
                    builder: (context, state) => const ReportsScreen(),
                  ),
                  GoRoute(
                    path: 'expenses',
                    name: RouteNames.expenses,
                    builder: (context, state) => const ExpensesScreen(),
                  ),
                  GoRoute(
                    path: 'visitors',
                    name: RouteNames.visitors,
                    builder: (context, state) => const VisitorsScreen(),
                  ),
                  GoRoute(
                    path: 'maintenance',
                    name: RouteNames.maintenance,
                    builder: (context, state) => const MaintenanceScreen(),
                    routes: [
                      GoRoute(
                        path: ':id',
                        name: RouteNames.maintenanceDetail,
                        builder: (context, state) => MaintenanceDetailScreen(
                          id: state.pathParameters['id'] ?? '',
                        ),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'notifications',
                    name: RouteNames.notifications,
                    builder: (context, state) => const NotificationsScreen(),
                  ),
                  GoRoute(
                    path: 'profile',
                    name: RouteNames.profile,
                    builder: (context, state) => const ProfileScreen(),
                    routes: [
                      GoRoute(
                        // `extra` says whether a PIN already exists, which decides what proves the
                        // change: the password for a first PIN, the current PIN for a rotation.
                        path: 'pin',
                        name: RouteNames.setPin,
                        builder: (context, state) =>
                            SetPinScreen(changing: state.extra == true),
                      ),
                    ],
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
