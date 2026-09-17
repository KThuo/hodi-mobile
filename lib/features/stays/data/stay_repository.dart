import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../domain/stay_detail_model.dart';
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

  /// One stay. The id is the public token the list row carried, passed back unchanged.
  Future<ApiResponse<StayDetailModel>> byId(String id) async {
    return _apiClient.get<StayDetailModel>(
      '${ApiConstants.stays}/$id',
      fromJsonT: (data) => StayDetailModel.fromJson(data as Map<String, dynamic>),
    );
  }

  /// What these dates cost.
  ///
  /// Answers either way: nights that cannot be sold come back as a success with `available` false
  /// and the reasons in it, because "those nights are taken" is what the guest asked about.
  Future<ApiResponse<StayQuoteModel>> quote({
    required String id,
    required DateTime checkIn,
    required DateTime checkOut,
    int guests = 1,
  }) async {
    return _apiClient.get<StayQuoteModel>(
      '${ApiConstants.stays}/$id/quote',
      queryParameters: {
        'checkIn': _date(checkIn),
        'checkOut': _date(checkOut),
        'guests': guests,
      },
      fromJsonT: (data) => StayQuoteModel.fromJson(data as Map<String, dynamic>),
    );
  }

  /// `yyyy-mm-dd`, which is the shape the server's `LocalDate` parameters take.
  String? _date(DateTime? when) => when == null
      ? null
      : '${when.year.toString().padLeft(4, '0')}-'
          '${when.month.toString().padLeft(2, '0')}-'
          '${when.day.toString().padLeft(2, '0')}';
}
