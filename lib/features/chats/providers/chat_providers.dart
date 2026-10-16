import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_client.dart';
import '../../../core/auth/providers/auth_provider.dart';
import '../../../core/permissions/app_permissions.dart';
import '../data/chat_repository.dart';
import '../domain/chat_models.dart';

final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  return ChatRepository(apiClient: ref.watch(apiClientProvider));
});

/// The inbox. Re-read by pulling down, and whenever a conversation is left — which is when its
/// unread count can have changed.
final chatInboxProvider = FutureProvider.autoDispose<Inbox>((ref) async {
  final response = await ref.watch(chatRepositoryProvider).inbox();
  if (!response.isSuccess || response.data == null) {
    throw Exception(response.message.isNotEmpty
        ? response.message
        : 'The conversations could not be loaded.');
  }
  return response.data!;
});

/// Unread messages across the inbox, for the row on More.
///
/// Zero for somebody without the authority and zero if the read fails, like the bell: a row that
/// cannot say how many is still a row.
final chatUnreadProvider = FutureProvider<int>((ref) async {
  final user = ref.watch(authProvider).user;
  if (user == null || !user.hasPermission(AppPermissions.chatView)) return 0;
  final response = await ref.watch(chatRepositoryProvider).unread();
  return response.isSuccess ? (response.data ?? 0) : 0;
});
