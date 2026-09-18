import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api/api_client.dart';
import '../auth/providers/auth_provider.dart';
import 'filter_option.dart';
import 'filter_repository.dart';

final filterRepositoryProvider = Provider<FilterRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return FilterRepository(apiClient: apiClient);
});

class FilterState {
  final List<FilterOption> estates;
  final List<FilterOption> properties;
  final String? selectedEstateId;
  final String? selectedPropertyId;
  final bool isLoading;

  const FilterState({
    this.estates = const [],
    this.properties = const [],
    this.selectedEstateId,
    this.selectedPropertyId,
    this.isLoading = false,
  });

  FilterState copyWith({
    List<FilterOption>? estates,
    List<FilterOption>? properties,
    String? Function()? selectedEstateId,
    String? Function()? selectedPropertyId,
    bool? isLoading,
  }) {
    return FilterState(
      estates: estates ?? this.estates,
      properties: properties ?? this.properties,
      selectedEstateId: selectedEstateId != null
          ? selectedEstateId()
          : this.selectedEstateId,
      selectedPropertyId: selectedPropertyId != null
          ? selectedPropertyId()
          : this.selectedPropertyId,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  bool get hasActiveFilter => selectedPropertyId != null;
}

class FilterNotifier extends Notifier<FilterState> {
  @override
  FilterState build() => const FilterState();

  FilterRepository get _repository => ref.read(filterRepositoryProvider);

  // What somebody is comes from the server, not from what they may do. The old test here —
  // tenant-access held and payments not — inverts on the new backend: ROLE_TENANT_ACCESS is the
  // staff authority for granting a tenant a sign-in, and the tenant group does hold ROLE_PAYMENT_VIEW.
  bool get _isSuperadmin => ref.read(authProvider).user?.isSuperadmin ?? false;

  bool get _isTenant => ref.read(authProvider).user?.isTenant ?? false;

  bool get isSuperadmin => _isSuperadmin;
  bool get isTenant => _isTenant;

  /// Fills both switchers.
  ///
  /// The estate list is fetched for everybody who has one, not only a superadmin: `/estates/
  /// options` is already scoped on the server, so a bank admin gets the bank's estates and an
  /// estate admin gets one. Asking only for superadmins meant a bank admin had no estate switcher
  /// at all.
  ///
  /// Properties are then asked for with whatever estate is selected — which is nothing, at first,
  /// and nothing is a valid answer: it means every property the caller may see. The old code
  /// skipped the call entirely unless the account carried an `estateId`, so a superadmin opened to
  /// an empty property switcher.
  Future<void> loadFilters() async {
    if (_isTenant) return;

    state = state.copyWith(isLoading: true);

    final estates = await _repository.getEstates();
    if (estates.isSuccess && estates.data != null) {
      state = state.copyWith(estates: estates.data);
    }

    // One estate to choose from is not a choice. Selecting it up front means the property
    // switcher beside it is scoped from the first frame rather than after a redundant tap.
    final own = ref.read(authProvider).user?.estateId;
    if (!_isSuperadmin && own != null && own.isNotEmpty) {
      state = state.copyWith(selectedEstateId: () => own);
    } else if (state.estates.length == 1) {
      state = state.copyWith(selectedEstateId: () => state.estates.single.id);
    }

    await _loadProperties(state.selectedEstateId);
    state = state.copyWith(isLoading: false);
  }

  Future<void> selectEstate(String? id) async {
    state = state.copyWith(
      selectedEstateId: () => id,
      // The property that was chosen belongs to the estate that was chosen. Keeping it would
      // filter to a property outside the estate now selected, which returns nothing and looks
      // like an empty estate.
      selectedPropertyId: () => null,
      isLoading: true,
    );

    await _loadProperties(id);
    state = state.copyWith(isLoading: false);
    _invalidateAllLists();
  }

  /// Null [estateId] is not "skip this" — it is "every property I may see".
  Future<void> _loadProperties(String? estateId) async {
    final response = await _repository.getProperties(estateId);
    state = state.copyWith(
      properties: response.isSuccess && response.data != null
          ? response.data
          : const <FilterOption>[],
    );
  }

  void selectProperty(String? id) {
    state = state.copyWith(selectedPropertyId: () => id);
    _invalidateAllLists();
  }

  void _invalidateAllLists() {
    // Invalidate all known list providers so they refetch with new filters.
    // We use a simple approach: providers watch filterProvider via ref.listen
    // in their notifiers, but since they're manual Notifiers we trigger
    // a rebuild by invalidating them directly.
    //
    // The providers are invalidated by the screens that watch filterProvider.
    // Each list notifier calls refresh() when filterProvider changes.
    //
    // We broadcast the change — listeners in providers handle the rest.
  }

  void reset() {
    state = const FilterState();
  }
}

final filterProvider = NotifierProvider<FilterNotifier, FilterState>(
  FilterNotifier.new,
);
