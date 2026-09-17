import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../../../core/api/paged_response.dart';
import '../domain/expense_model.dart';

class ExpenseRepository {
  final ApiClient _apiClient;

  ExpenseRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<ApiResponse<PagedResponse<ExpenseModel>>> list({
    int page = 0,
    int pageSize = 20,
    String? searchTerm,
    String? category,
    String? estateId,
    String? propertyId,
    String? from,
    String? to,
  }) async {
    return _apiClient.get<PagedResponse<ExpenseModel>>(
      ApiConstants.expenses,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
        'category': ?category,
        'estateId': ?estateId,
        'propertyId': ?propertyId,
        // `yyyy-mm-dd`, inclusive at both ends, either may be omitted.
        'from': ?from,
        'to': ?to,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => ExpenseModel.fromJson(item),
      ),
    );
  }

  /// Records one.
  ///
  /// `incurredOn` is optional on the server and defaults to today, but it is always sent: somebody
  /// entering a receipt on Tuesday for a Saturday callout wants Saturday, and a field that is
  /// usually right is worse than one that is asked for.
  Future<ApiResponse<ExpenseModel>> record({
    required String propertyId,
    required String name,
    required double amount,
    required String category,
    required String incurredOn,
    String? description,
  }) async {
    return _apiClient.post<ExpenseModel>(
      ApiConstants.expenses,
      data: {
        'propertyId': propertyId,
        'name': name,
        'amount': amount,
        'category': category,
        'incurredOn': incurredOn,
        if (description != null && description.trim().isNotEmpty)
          'description': description.trim(),
      },
      fromJsonT: (data) => ExpenseModel.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResponse<ExpenseModel>> update({
    required String id,
    required String propertyId,
    required String name,
    required double amount,
    required String category,
    required String incurredOn,
    String? description,
  }) async {
    return _apiClient.put<ExpenseModel>(
      '${ApiConstants.expenses}/$id',
      data: {
        'propertyId': propertyId,
        'name': name,
        'amount': amount,
        'category': category,
        'incurredOn': incurredOn,
        if (description != null && description.trim().isNotEmpty)
          'description': description.trim(),
      },
      fromJsonT: (data) => ExpenseModel.fromJson(data as Map<String, dynamic>),
    );
  }

  /// The standing charges, read only. Creating one is a desk decision — see
  /// [RecurringExpenseModel].
  Future<ApiResponse<PagedResponse<RecurringExpenseModel>>> recurring({
    int page = 0,
    int pageSize = 20,
    String? propertyId,
  }) async {
    return _apiClient.get<PagedResponse<RecurringExpenseModel>>(
      '${ApiConstants.expenses}/recurring',
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        'propertyId': ?propertyId,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => RecurringExpenseModel.fromJson(item),
      ),
    );
  }
}
