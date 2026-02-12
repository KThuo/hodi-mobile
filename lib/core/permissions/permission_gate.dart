import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'permission_provider.dart';

class PermissionGate extends ConsumerWidget {
  final List<String> permissions;
  final Widget child;
  final Widget? fallback;

  const PermissionGate({
    super.key,
    required this.permissions,
    required this.child,
    this.fallback,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasPermission = ref.watch(hasAnyPermissionProvider(permissions));

    if (hasPermission) {
      return child;
    }

    return fallback ?? const SizedBox.shrink();
  }
}
