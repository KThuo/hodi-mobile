import '../api/api_client.dart';
import '../api/api_constants.dart';
import '../api/api_response.dart';
import 'filter_option.dart';

/// What the estate and property switchers are filled from.
///
/// ## Both calls were aimed at the wrong endpoint
///
/// Estates asked `GET /estates`, which answers `PagedResult<EstateSummary>` — an object with a
/// `content` array, not an array. Properties asked `GET /properties/{estateId}`, which Spring
/// matches against `@GetMapping("/{id}")`: it read the estate's hash as a property id and answered
/// one `PropertyDetail`. Both were then cast to a list, both threw, and both switchers were left
/// empty.
///
/// The server has `/options` on each controller written for exactly this, returning `{id, label}`
/// and scoped to the caller — an estate admin sees their estate, a bank admin sees the bank's.
/// `hodi-f` uses those two and nothing else; so does this now.
class FilterRepository {
  final ApiClient _apiClient;

  FilterRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<ApiResponse<List<FilterOption>>> getEstates() async {
    return _apiClient.get<List<FilterOption>>(
      ApiConstants.estateOptions,
      fromJsonT: _options,
    );
  }

  /// Properties in one estate, or every property the caller may see when [estateId] is null.
  ///
  /// The estate is a query parameter, not a path segment. As a segment it named a property.
  Future<ApiResponse<List<FilterOption>>> getProperties(String? estateId) async {
    return _apiClient.get<List<FilterOption>>(
      ApiConstants.propertyOptions,
      queryParameters: {'estateId': ?estateId},
      fromJsonT: _options,
    );
  }

  static List<FilterOption> _options(dynamic data) => (data as List)
      .map((item) => FilterOption.fromJson(item as Map<String, dynamic>))
      .where((o) => o.usable)
      .toList();
}
