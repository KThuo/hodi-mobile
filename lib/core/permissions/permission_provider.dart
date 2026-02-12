import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../auth/providers/auth_provider.dart';

final hasPermissionProvider = Provider.family<bool, String>((ref, permission) {
  final authState = ref.watch(authProvider);
  return authState.user?.hasPermission(permission) ?? false;
});

final hasAnyPermissionProvider = Provider.family<bool, List<String>>((ref, permissions) {
  final authState = ref.watch(authProvider);
  return authState.user?.hasAnyPermission(permissions) ?? false;
});
