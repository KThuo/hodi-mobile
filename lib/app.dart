import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/auth/providers/auth_provider.dart';
import 'core/api/api_client.dart';

class HodiApp extends ConsumerStatefulWidget {
  const HodiApp({super.key});

  @override
  ConsumerState<HodiApp> createState() => _HodiAppState();
}

class _HodiAppState extends ConsumerState<HodiApp> {
  @override
  void initState() {
    super.initState();
    // Check stored auth state on app start
    Future.microtask(() {
      ref.read(authProvider.notifier).checkAuth();
    });

    // Listen for API errors (token expired, estate overdue)
    Future.microtask(() {
      final apiClient = ref.read(apiClientProvider);
      apiClient.errorStream.listen((error) {
        if (error.status == '003') {
          // Token expired - logout
          ref.read(authProvider.notifier).logout();
        } else if (error.status == '002') {
          // Estate overdue - show dialog
          _showOverdueDialog(error.message);
        }
      });
    });
  }

  void _showOverdueDialog(String message) {
    if (!mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Account Suspended'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
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
