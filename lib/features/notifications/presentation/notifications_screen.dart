import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/widgets/hodi_app_bar.dart';
import '../../../core/widgets/hodi_empty_state.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../domain/notification_model.dart';
import '../providers/notification_providers.dart';

/// Everything the platform has told this person.
///
/// Read-scoped by the server to the caller, so there is no permission to gate on and no filter for
/// whose these are — they are always yours.
class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        ref.read(notificationListProvider.notifier).loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _markAllRead() async {
    final error = await ref.read(notificationListProvider.notifier).markAllRead();
    if (!mounted || error == null) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
  }

  void _open(NotificationModel item) {
    ref.read(notificationListProvider.notifier).markRead(item);
    final route = item.mobileRoute;
    if (route != null) context.push(route);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(notificationListProvider);
    final anyUnread = state.items.any((n) => !n.read);

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: HodiAppBar(
        title: 'Notifications',
        actions: [
          if (anyUnread)
            TextButton(
              onPressed: _markAllRead,
              child: Text(
                'Mark all read',
                style: HodiTextStyles.bodySmall.copyWith(
                  color: HodiColors.primaryStart,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Row(
              children: [
                _Chip(
                  label: 'All',
                  selected: !state.unreadOnly,
                  onTap: () => ref
                      .read(notificationListProvider.notifier)
                      .showUnreadOnly(false),
                ),
                const SizedBox(width: 8),
                _Chip(
                  label: 'Unread',
                  selected: state.unreadOnly,
                  onTap: () => ref
                      .read(notificationListProvider.notifier)
                      .showUnreadOnly(true),
                ),
              ],
            ),
          ),
          Expanded(child: _buildList(state)),
        ],
      ),
    );
  }

  Widget _buildList(NotificationListState state) {
    if (state.isLoading && state.items.isEmpty) {
      return const HodiLoadingShimmer(itemCount: 5, itemHeight: 84);
    }
    if (state.error != null && state.items.isEmpty) {
      return HodiErrorState(
        message: state.error!,
        onRetry: () => ref.read(notificationListProvider.notifier).refresh(),
      );
    }
    if (state.items.isEmpty) {
      return HodiEmptyState(
        icon: Icons.notifications_none,
        title: state.unreadOnly ? 'Nothing unread' : 'No notifications',
        subtitle: state.unreadOnly
            ? 'You are up to date'
            : 'Anything the platform tells you will appear here',
      );
    }

    return RefreshIndicator(
      color: HodiColors.primaryStart,
      onRefresh: () => ref.read(notificationListProvider.notifier).refresh(),
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        itemCount: state.items.length + (state.hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == state.items.length) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          return _NotificationTile(
            item: state.items[index],
            onTap: () => _open(state.items[index]),
          );
        },
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({required this.item, required this.onTap});

  final NotificationModel item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final unread = !item.read;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        // Unread carries a tint and a dot; read is plain. Bold text alone is hard to judge on a
        // list where every row is a sentence.
        color: unread ? HodiColors.brandSoft : HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        border: Border.all(
          color: unread ? Colors.transparent : HodiColors.divider,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: HodiBorderRadius.card,
        child: InkWell(
          borderRadius: HodiBorderRadius.card,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: HodiColors.cardBackground,
                    borderRadius: HodiBorderRadius.small,
                  ),
                  child: Icon(_iconFor(item.template),
                      size: 18, color: HodiColors.primaryStart),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.heading,
                              style: HodiTextStyles.bodyMedium.copyWith(
                                fontWeight:
                                    unread ? FontWeight.w700 : FontWeight.w600,
                                color: HodiColors.textDark,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (unread) ...[
                            const SizedBox(width: 8),
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: HodiColors.primaryStart,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 3),
                      Text(
                        item.body,
                        style: HodiTextStyles.bodySmall
                            .copyWith(color: HodiColors.textMedium),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Text(
                            _when(item.createdOn),
                            style: HodiTextStyles.bodySmall.copyWith(
                              fontSize: 11,
                              color: HodiColors.textLight,
                            ),
                          ),
                          // Only where this app has the screen. The route is the web's, and the
                          // app does not carry every page the browser does — offering a tap that
                          // lands nowhere reads as the notification being broken.
                          if (item.canOpen) ...[
                            const Spacer(),
                            Text(
                              item.actionLabel ?? 'Open',
                              style: HodiTextStyles.bodySmall.copyWith(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: HodiColors.primaryStart,
                              ),
                            ),
                            Icon(Icons.chevron_right,
                                size: 14, color: HodiColors.primaryStart),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static String _when(String? raw) {
    final parsed = DateFormatter.parseApiDate(raw);
    if (parsed == null) return '';
    final age = DateTime.now().difference(parsed);
    // Recent things read better as an age; anything older reads better as a date.
    return age.inDays >= 7
        ? DateFormatter.formatDate(parsed)
        : DateFormatter.timeAgo(parsed);
  }

  /// A glyph per family of notification, matched on the template's prefix so a new template in a
  /// family the app knows still gets the right icon rather than the fallback.
  static IconData _iconFor(String? template) {
    final t = (template ?? '').toUpperCase();
    if (t.startsWith('INVOICE')) return Icons.receipt_long_outlined;
    if (t.startsWith('PAYMENT') || t.startsWith('RECEIPT')) {
      return Icons.payments_outlined;
    }
    if (t.startsWith('MAINT')) return Icons.build_outlined;
    if (t.startsWith('VISIT')) return Icons.meeting_room_outlined;
    if (t.startsWith('VACATE')) return Icons.logout_outlined;
    if (t.startsWith('LEASE')) return Icons.description_outlined;
    if (t.startsWith('METER') || t.startsWith('METRE')) return Icons.speed_outlined;
    return Icons.notifications_none;
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? HodiColors.primaryStart : HodiColors.surfaceLight,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: selected ? HodiColors.white : HodiColors.textMedium,
          ),
        ),
      ),
    );
  }
}
