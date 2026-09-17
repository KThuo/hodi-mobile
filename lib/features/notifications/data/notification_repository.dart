import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../../../core/api/paged_response.dart';
import '../domain/notification_model.dart';

class NotificationRepository {
  final ApiClient _apiClient;

  NotificationRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<ApiResponse<PagedResponse<NotificationModel>>> list({
    int page = 0,
    int pageSize = 20,
    bool unreadOnly = false,
  }) async {
    return _apiClient.get<PagedResponse<NotificationModel>>(
      ApiConstants.notifications,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        if (unreadOnly) 'unreadOnly': true,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => NotificationModel.fromJson(item),
      ),
    );
  }

  /// Just the number. Its own endpoint because it is polled, and none of the screens that want it
  /// want twenty rows to get it.
  Future<ApiResponse<int>> unreadCount() async {
    return _apiClient.get<int>(
      '${ApiConstants.notifications}/unread-count',
      fromJsonT: (data) =>
          ((data as Map<String, dynamic>)['unread'] as num?)?.toInt() ?? 0,
    );
  }

  Future<ApiResponse<NotificationModel>> markRead(String id) async {
    return _apiClient.post<NotificationModel>(
      '${ApiConstants.notifications}/$id/read',
      fromJsonT: (data) => NotificationModel.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResponse<int>> markAllRead() async {
    return _apiClient.post<int>(
      '${ApiConstants.notifications}/read-all',
      fromJsonT: (data) =>
          ((data as Map<String, dynamic>)['marked'] as num?)?.toInt() ?? 0,
    );
  }
}
