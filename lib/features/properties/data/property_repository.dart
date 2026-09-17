import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../../../core/api/paged_response.dart';
import '../domain/property_model.dart';
import '../domain/property_detail_model.dart';
import '../domain/property_report_model.dart';

class PropertyRepository {
  final ApiClient _apiClient;

  PropertyRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<ApiResponse<PagedResponse<PropertyModel>>> getProperties({
    int page = 0,
    int pageSize = 20,
    String? searchTerm,
    String? estateId,
    String? propertyId,
  }) async {
    return _apiClient.get<PagedResponse<PropertyModel>>(
      ApiConstants.properties,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
        'estateId': ?estateId,
        'propertyId': ?propertyId,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => PropertyModel.fromJson(item),
      ),
    );
  }

  /// The property itself — what it is, who to call, how it is set up.
  ///
  /// No `period` parameter. It used to take one, to move a set of money columns backwards and
  /// forwards a month; the rebuilt endpoint has neither the parameter nor the columns, because a
  /// property's month is a report. See [getPropertyReport].
  Future<ApiResponse<PropertyDetailModel>> getPropertyDetail(String id) async {
    return _apiClient.get<PropertyDetailModel>(
      '${ApiConstants.properties}/$id',
      fromJsonT: (data) =>
          PropertyDetailModel.fromJson(data as Map<String, dynamic>),
    );
  }

  /// One property's month, as a page of the report with its totals.
  ///
  /// Behind `ROLE_REPORT_VIEW`, which is a narrower gate than the property page itself — a
  /// caretaker can be allowed to see the block without being allowed to see what it collects. The
  /// caller checks the authority before asking; this returns the server's refusal otherwise.
  ///
  /// The figures come off `totals` rather than the first row. For a single property the two agree,
  /// but they are different quantities, and reading a row is what had the web's estate card
  /// showing whichever property sorted first as the estate's collection.
  Future<ApiResponse<PropertyReportPageModel>> getPropertyReport({
    required String propertyId,
    required int year,
    required int month,
  }) async {
    return _apiClient.get<PropertyReportPageModel>(
      ApiConstants.propertyReports,
      queryParameters: {
        'propertyId': propertyId,
        'year': year,
        'month': month,
        'page': 0,
        // One property is one row per month. Asked for generously anyway, because the totals are
        // totals of the rows on the page and a page that cut rows off would under-report.
        'pageSize': 50,
      },
      fromJsonT: (data) =>
          PropertyReportPageModel.fromJson(data as Map<String, dynamic>),
    );
  }
}
