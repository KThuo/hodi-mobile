import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_client.dart';
import '../data/profile_repository.dart';
import '../domain/profile_model.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return ProfileRepository(apiClient: apiClient);
});

final profileProvider = FutureProvider.autoDispose<ProfileModel?>((ref) async {
  final repo = ref.watch(profileRepositoryProvider);
  final response = await repo.getProfile();
  if (!response.isSuccess) {
    throw Exception(response.message.isNotEmpty ? response.message : 'Failed to load profile');
  }
  return response.data;
});
