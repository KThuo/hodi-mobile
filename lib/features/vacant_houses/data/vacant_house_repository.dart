import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../../../core/api/paged_response.dart';
import '../domain/vacant_house_model.dart';
import '../domain/vacant_house_detail_model.dart';

/// What is available to rent.
///
/// ## Three of these paths were wrong, and one of them produced a strange error
///
/// The app called `/vacant-units/search`, `/vacant-units/{id}/details` and two
/// `/vacant-units/filters/*` paths. None exists. The server has `GET /vacant-units` for the
/// search, `GET /vacant-units/{id}` for one listing, and a single `GET /vacant-units/filters`.
///
/// `/search` is the interesting failure: Spring matched it against `@GetMapping("/{id}")` with the
/// id `"search"`, and `PublicIds.require` parses base 36 — every letter in "search" is a valid
/// digit — so it decoded to a number out of range and answered *"That listing link is not one we
/// recognise."* A wrong path, reported as a bad link.
///
/// Everything here is public. Somebody looking for a place to live does not have an account yet.
class VacantHouseRepository {
  final ApiClient _apiClient;

  VacantHouseRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<ApiResponse<PagedResponse<VacantHouseModel>>> searchVacantHouses({
    int page = 0,
    int pageSize = 20,
    String? searchTerm,
    String? category,
    String? area,
    double? minRent,
    double? maxRent,
    int? minBedrooms,
  }) async {
    return _apiClient.get<PagedResponse<VacantHouseModel>>(
      ApiConstants.vacantUnits,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
        'category': ?category,
        'area': ?area,
        'minRent': ?minRent,
        'maxRent': ?maxRent,
        'minBedrooms': ?minBedrooms,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => VacantHouseModel.fromJson(item),
      ),
    );
  }

  /// One listing. The id is the public token the list row carried.
  Future<ApiResponse<VacantHouseDetailModel>> getVacantHouseDetail(String id) async {
    return _apiClient.get<VacantHouseDetailModel>(
      '${ApiConstants.vacantUnits}/$id',
      fromJsonT: (data) =>
          VacantHouseDetailModel.fromJson(data as Map<String, dynamic>),
    );
  }

  /// Everything filterable, in one call — categories and areas, each with a count, plus the rent
  /// range actually present. The app was asking for two endpoints that do not exist, one of them
  /// for house types the server does not filter on.
  Future<ApiResponse<ListingFilters>> filters() async {
    return _apiClient.get<ListingFilters>(
      '${ApiConstants.vacantUnits}/filters',
      fromJsonT: (data) => ListingFilters.fromJson(data as Map<String, dynamic>),
    );
  }
}
