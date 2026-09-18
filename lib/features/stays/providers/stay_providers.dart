import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_client.dart';
import '../data/stay_repository.dart';
import '../domain/stay_model.dart';

final stayRepositoryProvider = Provider<StayRepository>((ref) {
  return StayRepository(apiClient: ref.watch(apiClientProvider));
});

/// What somebody has narrowed the list to.
///
/// The same questions `StaysPage.vue` asks, in the same order: where, when, how many, then beds,
/// then the two behind "More filters". It used to be two fields, which is why the mobile screen
/// and the web screen did not look like the same product.
class StayQuery {
  const StayQuery({
    this.searchTerm,
    this.checkIn,
    this.checkOut,
    this.guests,
    this.minBedrooms,
    this.minBathrooms,
    this.maxNightly,
    this.sort = StaySort.cheapest,
  });

  final String? searchTerm;
  final DateTime? checkIn;
  final DateTime? checkOut;
  final int? guests;
  final int? minBedrooms;
  final int? minBathrooms;
  final double? maxNightly;
  final StaySort sort;

  /// How many nights were asked for, or null when no dates were.
  ///
  /// The web needs this for more than arithmetic: "Nothing free for those dates" is only true
  /// when dates are what excluded everything, and blaming the calendar for a bedroom filter sends
  /// somebody off to try other nights forever.
  int? get nights {
    final from = checkIn;
    final to = checkOut;
    if (from == null || to == null) return null;
    final days = to.difference(from).inDays;
    return days > 0 ? days : null;
  }

  /// What a "Clear" would undo. Guests is excluded, as it is on the web: it defaults to a real
  /// number rather than to nothing, so it is never "a filter somebody set".
  int get activeCount => [
        nights,
        minBedrooms,
        minBathrooms,
        maxNightly,
        (searchTerm?.trim().isNotEmpty ?? false) ? searchTerm : null,
      ].whereType<Object>().length;

  StayQuery copyWith({
    String? Function()? searchTerm,
    DateTime? Function()? checkIn,
    DateTime? Function()? checkOut,
    int? Function()? guests,
    int? Function()? minBedrooms,
    int? Function()? minBathrooms,
    double? Function()? maxNightly,
    StaySort? sort,
  }) {
    return StayQuery(
      searchTerm: searchTerm != null ? searchTerm() : this.searchTerm,
      checkIn: checkIn != null ? checkIn() : this.checkIn,
      checkOut: checkOut != null ? checkOut() : this.checkOut,
      guests: guests != null ? guests() : this.guests,
      minBedrooms: minBedrooms != null ? minBedrooms() : this.minBedrooms,
      minBathrooms: minBathrooms != null ? minBathrooms() : this.minBathrooms,
      maxNightly: maxNightly != null ? maxNightly() : this.maxNightly,
      sort: sort ?? this.sort,
    );
  }
}

/// The two orders the web offers.
///
/// `space` is applied here rather than asked for, because the server has no such sort and the web
/// does the same thing in the same place — it reorders what came back.
enum StaySort {
  cheapest('Cheapest first'),
  mostRoom('Most room first');

  const StaySort(this.label);

  final String label;
}

class StayQueryNotifier extends Notifier<StayQuery> {
  @override
  StayQuery build() => const StayQuery();

  void search(String term) =>
      state = state.copyWith(searchTerm: () => term.isEmpty ? null : term);

  void setDates(DateTime? from, DateTime? to) =>
      state = state.copyWith(checkIn: () => from, checkOut: () => to);

  void forGuests(int? guests) => state = state.copyWith(guests: () => guests);

  void setBedrooms(int? n) => state = state.copyWith(minBedrooms: () => n);

  void sortBy(StaySort sort) => state = state.copyWith(sort: sort);

  /// The sheet's fields, applied together — one refetch, not one per field.
  void applyMore({
    required int? guests,
    required int? minBathrooms,
    required double? maxNightly,
  }) {
    state = state.copyWith(
      guests: () => guests,
      minBathrooms: () => minBathrooms,
      maxNightly: () => maxNightly,
    );
  }

  void clear() => state = StayQuery(sort: state.sort);
}

final stayQueryProvider =
    NotifierProvider<StayQueryNotifier, StayQuery>(StayQueryNotifier.new);

final staysProvider = FutureProvider.autoDispose<List<StayModel>>((ref) async {
  final query = ref.watch(stayQueryProvider);

  final response = await ref.watch(stayRepositoryProvider).search(
        searchTerm: query.searchTerm,
        // Only sent as a pair. One date alone is not a stay, and the server would read a lone
        // check-in as "available from then on", which is not what a half-filled picker means.
        checkIn: query.nights == null ? null : query.checkIn,
        checkOut: query.nights == null ? null : query.checkOut,
        guests: query.guests,
        minBedrooms: query.minBedrooms,
        minBathrooms: query.minBathrooms,
        maxNightly: query.maxNightly,
      );

  if (!response.isSuccess) {
    throw Exception(
        response.message.isEmpty ? 'Stays could not be loaded' : response.message);
  }

  final stays = response.data ?? const <StayModel>[];
  if (query.sort != StaySort.mostRoom) return stays;

  return [...stays]..sort((a, b) => (b.sleeps ?? 0).compareTo(a.sleeps ?? 0));
});
