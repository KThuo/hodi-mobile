import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../domain/stay_model.dart';

/// The public half of HODI BNB: what is bookable, and what it would cost.
///
/// No session anywhere here. Somebody looking for somewhere to stay does not have an account yet,
/// which is the whole point of the screen — so these paths are on the server's public allowlist and
/// this repository never asks for a token.
class StayRepository {
  final ApiClient _apiClient;

  StayRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  /// A list rather than a page: the server caps it with `limit`, because an endless scroll of
  /// listings is a worse way to find one than a filter is.
  Future<ApiResponse<List<StayModel>>> search({
    String? searchTerm,
    DateTime? checkIn,
    DateTime? checkOut,
    int? guests,
    double? maxNightly,
    int limit = 24,
  }) async {
    return _apiClient.get<List<StayModel>>(
      ApiConstants.stays,
      queryParameters: {
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
        'checkIn': ?_date(checkIn),
        'checkOut': ?_date(checkOut),
        'guests': ?guests,
        'maxNightly': ?maxNightly,
        'limit': limit,
      },
      fromJsonT: (data) => (data as List)
          .map((e) => StayModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// `yyyy-mm-dd`, which is the shape the server's `LocalDate` parameters take.
  String? _date(DateTime? when) => when == null
      ? null
      : '${when.year.toString().padLeft(4, '0')}-'
          '${when.month.toString().padLeft(2, '0')}-'
          '${when.day.toString().padLeft(2, '0')}';
}
