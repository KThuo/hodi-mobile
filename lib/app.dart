import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/hodi_colors.dart';
import 'core/auth/providers/auth_provider.dart';
import 'core/api/api_client.dart';
import 'core/branding/branding_repository.dart';

class HodiApp extends ConsumerStatefulWidget {
  const HodiApp({super.key});

  @override
  ConsumerState<HodiApp> createState() => _HodiAppState();
}

class _HodiAppState extends ConsumerState<HodiApp> with WidgetsBindingObserver {
  StreamSubscription? _errorSubscription;
  bool _isDialogShowing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    Future.microtask(() async {
      /*
       * Branding first, and the cache before the network.
       *
       * The cached palette is applied synchronously so the splash is already in this deployment's
       * colours rather than the shipped ones; the refresh then catches a brand that changed since
       * last launch. Neither can fail the start — both resolve to whatever is already painted.
       *
       * Both run before the session check finishes, so they happen inside the splash the router is
       * holding on rather than adding a wait of their own. See SplashScreen.
       */
      final branding = ref.read(brandingRepositoryProvider);
      await branding.cached();
      if (mounted) setState(() {});

      unawaited(branding.refresh().then((_) {
        if (mounted) setState(() {});
      }));

      await ref.read(authProvider.notifier).checkAuth();
    });

    Future.microtask(() {
      final apiClient = ref.read(apiClientProvider);
      _errorSubscription = apiClient.errorStream.listen((error) {
        if (error.status == '003') {
          ref.read(authProvider.notifier).sessionExpired();
        } else if (error.status == '002') {
          _showErrorDialog(error.message);
        } else if (error.status == '004') {
          // Not a dialogue. Every call answers with this until the password is changed, so a
          // dialogue would be dismissed and immediately raised again by the next request. The
          // router holds the app on the change-password screen instead.
          ref.read(authProvider.notifier).passwordChangeRequired();
        }
      });
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkTokenOnResume();
    }
  }

  Future<void> _checkTokenOnResume() async {
    final authState = ref.read(authProvider);
    if (!authState.isAuthenticated) return;

    final storage = ref.read(authLocalStorageProvider);
    final isValid = await storage.isTokenValid();
    if (!isValid) {
      ref.read(authProvider.notifier).sessionExpired();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _errorSubscription?.cancel();
    super.dispose();
  }

  void _showErrorDialog(String message) {
    if (_isDialogShowing) return;
    final navContext = rootNavigatorKey.currentContext;
    if (navContext == null) return;

    _isDialogShowing = true;

    showGeneralDialog(
      context: navContext,
      barrierDismissible: false,
      barrierLabel: 'Error',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 250),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            constraints: const BoxConstraints(maxWidth: 360),
            decoration: BoxDecoration(
              color: HodiColors.cardBackground,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: HodiColors.errorStart.withValues(alpha: 0.15),
                  blurRadius: 32,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(24),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(28, 32, 28, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            HodiColors.errorStart.withValues(alpha: 0.12),
                            HodiColors.errorEnd.withValues(alpha: 0.08),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.error_outline_rounded,
                        size: 32,
                        color: HodiColors.errorStart,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: HodiColors.textDark,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [HodiColors.primaryStart, HodiColors.primaryEnd],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: HodiColors.primaryStart.withValues(alpha: 0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                            _isDialogShowing = false;
                            // Navigate back to the previous screen
                            final nav = rootNavigatorKey.currentState;
                            if (nav != null && nav.canPop()) {
                              nav.pop();
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'OK',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: HodiColors.white,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'HODI',
      theme: AppTheme.light,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
