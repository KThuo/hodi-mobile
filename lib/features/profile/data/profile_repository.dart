import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../domain/profile_model.dart';

class ProfileRepository {
  final ApiClient _apiClient;

  ProfileRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<ApiResponse<ProfileModel>> getProfile() async {
    return _apiClient.get<ProfileModel>(
      ApiConstants.me,
      fromJsonT: (data) => ProfileModel.fromJson(data as Map<String, dynamic>),
    );
  }
}
