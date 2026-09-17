import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../../../core/api/paged_response.dart';
import '../domain/house_model.dart';
import '../domain/house_detail_model.dart';

/// Units — what legacy called houses.
///
/// Every id here is a HashId string and goes into the path exactly as the server sent it. The
/// detail endpoint decodes it with `HashIds.require`, so an integer, or a hash this user was not
/// given, is a "Unit not found" and not an authorisation error — the server says the same thing
/// for both on purpose.
class HouseRepository {
  final ApiClient _apiClient;

  HouseRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<ApiResponse<PagedResponse<HouseModel>>> getHouses({
    int page = 0,
    int pageSize = 20,
    String? propertyId,
    String? occupied,
    String? searchTerm,
    String? categoryId,
    String? estateId,
  }) async {
    return _apiClient.get<PagedResponse<HouseModel>>(
      ApiConstants.units,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        'propertyId': ?propertyId,
        'occupied': ?occupied,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
        'categoryId': ?categoryId,
        'estateId': ?estateId,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => HouseModel.fromJson(item),
      ),
    );
  }

  /// One unit, with its features already in it.
  ///
  /// There is no companion features call any more. The old one asked
  /// `catalogue/features/{houseId}`, which is the catalogue of what a feature can be and takes no
  /// unit id at all — so it answered with the whole catalogue or with nothing, and either way not
  /// with this unit's features.
  Future<ApiResponse<HouseDetailModel>> getHouseDetail(String id) async {
    return _apiClient.get<HouseDetailModel>(
      '${ApiConstants.units}/$id',
      fromJsonT: (data) => HouseDetailModel.fromJson(data as Map<String, dynamic>),
    );
  }
}
