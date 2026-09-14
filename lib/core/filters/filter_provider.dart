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

  Future<void> loadFilters() async {
    if (_isTenant) return;

    state = state.copyWith(isLoading: true);

    // Superadmin: fetch estates
    if (_isSuperadmin) {
      final estatesResponse = await _repository.getEstates();
      if (estatesResponse.isSuccess && estatesResponse.data != null) {
        state = state.copyWith(estates: estatesResponse.data);
      }
    }

    // Fetch properties using the user's estateId
    final user = ref.read(authProvider).user;
    final estateId = user?.estateId;
    if (estateId != null && estateId.isNotEmpty) {
      // Admin/caretaker: prefill estate filter with their estate
      if (!_isSuperadmin) {
        state = state.copyWith(selectedEstateId: () => estateId);
      }

      final propertiesResponse = await _repository.getProperties(estateId);
      if (propertiesResponse.isSuccess && propertiesResponse.data != null) {
        state = state.copyWith(properties: propertiesResponse.data);
      }
    }

    state = state.copyWith(isLoading: false);
  }

  Future<void> selectEstate(String? id) async {
    state = state.copyWith(
      selectedEstateId: () => id,
      selectedPropertyId: () => null,
      isLoading: true,
    );

    // Reload properties for selected estate (or user's estate if "All")
    final estateId = id ?? ref.read(authProvider).user?.estateId;
    if (estateId != null && estateId.isNotEmpty) {
      final propertiesResponse = await _repository.getProperties(estateId);
      if (propertiesResponse.isSuccess && propertiesResponse.data != null) {
        state = state.copyWith(properties: propertiesResponse.data);
      }
    } else {
      state = state.copyWith(properties: []);
    }

    state = state.copyWith(isLoading: false);
    _invalidateAllLists();
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
