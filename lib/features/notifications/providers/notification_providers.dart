import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_client.dart';
import '../../../core/auth/providers/auth_provider.dart';
import '../data/notification_repository.dart';
import '../domain/notification_model.dart';

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  return NotificationRepository(apiClient: ref.watch(apiClientProvider));
});

/// What the badge shows.
///
/// Not polled on a timer. A badge that ticks up while somebody reads a screen is not worth a
/// request every thirty seconds on a handset's battery and data — it is refreshed when the app
/// comes back to the foreground and when the list is read, which is when the number can actually
/// have changed from this person's point of view.
///
/// Zero rather than an error if the read fails: a bell that cannot say how many is still a bell.
final unreadCountProvider = FutureProvider<int>((ref) async {
  // Rebuilds on sign-in and sign-out, so the count never belongs to the previous session.
  final signedIn = ref.watch(authProvider).isAuthenticated;
  if (!signedIn) return 0;

  final response = await ref.watch(notificationRepositoryProvider).unreadCount();
  return response.isSuccess ? (response.data ?? 0) : 0;
});

class NotificationListState {
  final List<NotificationModel> items;
  final bool isLoading;
  final bool hasMore;
  final int currentPage;
  final String? error;
  final bool unreadOnly;

  const NotificationListState({
    this.items = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.currentPage = 0,
    this.error,
    this.unreadOnly = false,
  });

  NotificationListState copyWith({
    List<NotificationModel>? items,
    bool? isLoading,
    bool? hasMore,
    int? currentPage,
    String? error,
    bool? unreadOnly,
  }) {
    return NotificationListState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      error: error,
      unreadOnly: unreadOnly ?? this.unreadOnly,
    );
  }
}

class NotificationListNotifier extends Notifier<NotificationListState> {
  @override
  NotificationListState build() {
    Future.microtask(() => _fetchPage(0));
    return const NotificationListState(isLoading: true);
  }

  NotificationRepository get _repository =>
      ref.read(notificationRepositoryProvider);

  Future<void> _fetchPage(int page) async {
    final response = await _repository.list(
      page: page,
      unreadOnly: state.unreadOnly,
    );

    if (response.isSuccess && response.data != null) {
      final paged = response.data!;
      state = state.copyWith(
        items: page == 0 ? paged.content : [...state.items, ...paged.content],
        isLoading: false,
        hasMore: paged.hasMore,
        currentPage: page,
      );
    } else {
      state = state.copyWith(isLoading: false, error: response.message);
    }
  }

  Future<void> loadMore() async {
    if (state.isLoading || !state.hasMore) return;
    state = state.copyWith(isLoading: true);
    await _fetchPage(state.currentPage + 1);
  }

  Future<void> refresh() async {
    state = state.copyWith(isLoading: true, error: null);
    await _fetchPage(0);
    ref.invalidate(unreadCountProvider);
  }

  Future<void> showUnreadOnly(bool only) async {
    state = NotificationListState(isLoading: true, unreadOnly: only);
    await _fetchPage(0);
  }

  /// Marks one read, and shows it read at once.
  ///
  /// The row is updated locally before the server answers, because this runs as somebody taps
  /// through to what the notification is about — waiting for a round trip to un-bold a line they
  /// have already left is a change they never see. A failure puts it back.
  Future<void> markRead(NotificationModel item) async {
    if (item.read) return;

    state = state.copyWith(
      items: [
        for (final n in state.items)
          if (n.id == item.id) n.copyWith(read: true) else n,
      ],
    );
    ref.invalidate(unreadCountProvider);

    final response = await _repository.markRead(item.id);
    if (!response.isSuccess) {
      state = state.copyWith(
        items: [
          for (final n in state.items)
            if (n.id == item.id) n.copyWith(read: false) else n,
        ],
      );
      ref.invalidate(unreadCountProvider);
    }
  }

  Future<String?> markAllRead() async {
    final response = await _repository.markAllRead();
    if (!response.isSuccess) {
      return response.message.isNotEmpty
          ? response.message
          : 'Those could not be marked read.';
    }
    await refresh();
    return null;
  }
}

final notificationListProvider =
    NotifierProvider<NotificationListNotifier, NotificationListState>(
  NotificationListNotifier.new,
);
