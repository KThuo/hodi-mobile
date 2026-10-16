import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../domain/chat_models.dart';

/// The inbox, the office conversation, and a repair's chat.
///
/// The move-out notice's conversation stays in its own repository; the inbox only lists it.
class ChatRepository {
  final ApiClient _apiClient;

  ChatRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  /// Every conversation this person is in, newest message first.
  Future<ApiResponse<Inbox>> inbox() {
    return _apiClient.get<Inbox>(
      ApiConstants.chats,
      fromJsonT: (data) => Inbox.fromJson(Map<String, dynamic>.from(data as Map)),
    );
  }

  /// Unread messages across the inbox, for the badge on More.
  Future<ApiResponse<int>> unread() {
    return _apiClient.get<int>(
      '${ApiConstants.chats}/unread',
      fromJsonT: (data) => (data as num).toInt(),
    );
  }

  // ── Contact admin ─────────────────────────────────────────────────────────

  /// The tenant's conversation with their estate office, started if it does not exist yet.
  /// Returns its id, or throws with the server's message — "You rent in more than one estate" is
  /// worth reading as it is.
  Future<String> openOffice() async {
    final response = await _apiClient.post<String>(
      '${ApiConstants.chats}/office',
      data: const <String, dynamic>{},
      fromJsonT: (data) => (Map<String, dynamic>.from(data as Map))['id'] as String,
    );
    if (!response.isSuccess || response.data == null) {
      throw Exception(response.message.isNotEmpty
          ? response.message
          : 'The estate office could not be reached.');
    }
    return response.data!;
  }

  Future<ApiResponse<ChatView>> office(String id) {
    return _apiClient.get<ChatView>(
      '${ApiConstants.chats}/office/$id',
      fromJsonT: (data) => ChatView.fromJson(Map<String, dynamic>.from(data as Map)),
    );
  }

  /// Multipart, so a photo can ride along, as on a notice.
  Future<void> postToOffice(String id, String body, {XFile? photo}) async {
    final response = await _apiClient.uploadFile(
      '${ApiConstants.chats}/office/$id',
      data: FormData.fromMap({
        'body': body,
        if (photo != null) 'file': await MultipartFile.fromFile(photo.path, filename: photo.name),
      }),
    );
    final data = response.data;
    if (data is Map && data['status'] != '00') {
      throw Exception((data['message'] as String?) ?? 'The message was not sent.');
    }
  }

  Future<void> openOfficeFile(String id, String messageId, {required bool pdf}) async {
    final dir = await getTemporaryDirectory();
    final path = '${dir.path}/office-$id-$messageId.${pdf ? 'pdf' : 'jpg'}';
    await _apiClient.downloadFile('${ApiConstants.chats}/office/$id/messages/$messageId/file', path);
    await OpenFilex.open(path);
  }

  // ── A repair's chat ───────────────────────────────────────────────────────

  Future<ApiResponse<ChatView>> repair(String requestId) {
    return _apiClient.get<ChatView>(
      '${ApiConstants.maintenance}/requests/$requestId/chat',
      fromJsonT: (data) => ChatView.fromJson(Map<String, dynamic>.from(data as Map)),
    );
  }

  /// A message on a repair — its comment. [visibleToTenant] is the office's choice and is not
  /// sent at all from a tenant, whose words are always theirs to see.
  Future<ChatEntry> postToRepair(String requestId, String body, {bool? visibleToTenant}) async {
    final response = await _apiClient.post<ChatEntry>(
      '${ApiConstants.maintenance}/requests/$requestId/chat',
      data: {
        'body': body,
        'visibleToTenant': ?visibleToTenant,
      },
      fromJsonT: (data) => ChatEntry.fromJson(Map<String, dynamic>.from(data as Map)),
    );
    if (!response.isSuccess || response.data == null) {
      throw Exception(response.message.isNotEmpty ? response.message : 'The message was not sent.');
    }
    return response.data!;
  }
}
