import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_client.dart';
import '../data/stay_repository.dart';
import '../domain/stay_model.dart';

final stayRepositoryProvider = Provider<StayRepository>((ref) {
  return StayRepository(apiClient: ref.watch(apiClientProvider));
});

/// What somebody has narrowed the list to. Deliberately small: a public browse screen that opens
/// with eight filters is one nobody gets past.
class StayQuery {
  const StayQuery({this.searchTerm, this.guests});

  final String? searchTerm;
  final int? guests;

  StayQuery copyWith({String? searchTerm, int? guests}) =>
      StayQuery(searchTerm: searchTerm ?? this.searchTerm, guests: guests ?? this.guests);
}

class StayQueryNotifier extends Notifier<StayQuery> {
  @override
  StayQuery build() => const StayQuery();

  void search(String term) => state = StayQuery(searchTerm: term, guests: state.guests);

  void forGuests(int? guests) => state = StayQuery(searchTerm: state.searchTerm, guests: guests);
}

final stayQueryProvider = NotifierProvider<StayQueryNotifier, StayQuery>(StayQueryNotifier.new);

final staysProvider = FutureProvider.autoDispose<List<StayModel>>((ref) async {
  final query = ref.watch(stayQueryProvider);
  final response = await ref.watch(stayRepositoryProvider).search(
        searchTerm: query.searchTerm,
        guests: query.guests,
      );
  if (!response.isSuccess) {
    throw Exception(response.message.isEmpty ? 'Stays could not be loaded' : response.message);
  }
  return response.data ?? const [];
});
