import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/auth/providers/auth_provider.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_shadows.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/widgets/hodi_app_bar.dart';
import '../../../core/widgets/hodi_empty_state.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../domain/chat_models.dart';
import '../providers/chat_providers.dart';

/// Every conversation this person is in — move-out notices, repairs and the estate office — newest
/// message first, with what is unread.
///
/// A tenant also gets Contact admin, which opens their standing conversation with the estate
/// office, starting it the first time. The office replies from here; it does not start one.
class ChatsScreen extends ConsumerStatefulWidget {
  const ChatsScreen({super.key});

  @override
  ConsumerState<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends ConsumerState<ChatsScreen> {
  bool _opening = false;

  /// Whatever was opened may have been read; the counts here and on More move with it.
  void _refresh() {
    ref.invalidate(chatInboxProvider);
    ref.invalidate(chatUnreadProvider);
  }

  Future<void> _open(String route) async {
    await context.push(route);
    if (mounted) _refresh();
  }

  Future<void> _contactAdmin() async {
    setState(() => _opening = true);
    try {
      final id = await ref.read(chatRepositoryProvider).openOffice();
      if (!mounted) return;
      await _open('/more/chats/office/$id');
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString().replaceFirst('Exception: ', '')),
        backgroundColor: HodiColors.errorStart,
      ));
    } finally {
      if (mounted) setState(() => _opening = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final inbox = ref.watch(chatInboxProvider);
    final tenant = ref.watch(authProvider).user?.isTenant ?? false;

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: const HodiAppBar(title: 'Chats'),
      floatingActionButton: tenant
          ? FloatingActionButton.extended(
              onPressed: _opening ? null : _contactAdmin,
              backgroundColor: HodiColors.primaryStart,
              foregroundColor: HodiColors.white,
              icon: _opening
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                  : const Icon(Icons.support_agent),
              label: const Text('Contact admin'),
            )
          : null,
      body: inbox.when(
        loading: () => const HodiLoadingShimmer(itemCount: 5, itemHeight: 76),
        error: (e, _) => HodiErrorState(
          message: e.toString().replaceFirst('Exception: ', ''),
          onRetry: _refresh,
        ),
        data: (box) => RefreshIndicator(
          color: HodiColors.primaryStart,
          onRefresh: () async => _refresh(),
          child: box.items.isEmpty
              // A scrollable empty state, so pulling down still refreshes it.
              ? ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    const SizedBox(height: 80),
                    HodiEmptyState(
                      icon: Icons.forum_outlined,
                      title: 'No conversations yet',
                      subtitle: tenant
                          ? 'Messages about your repairs and move-out appear here. '
                              'Contact admin to write to the estate office.'
                          : 'Messages from tenants about repairs, move-outs and anything else '
                              'appear here.',
                    ),
                  ],
                )
              : ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 96),
                  itemCount: box.items.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (context, i) => _ChatTile(
                    item: box.items[i],
                    onTap: () => _open(box.items[i].route),
                  ),
                ),
        ),
      ),
    );
  }
}

class _ChatTile extends StatelessWidget {
  const _ChatTile({required this.item, required this.onTap});

  final InboxItem item;
  final VoidCallback onTap;

  IconData get _icon => switch (item.kind) {
        'VACATE' => Icons.logout,
        'REPAIR' => Icons.build_outlined,
        _ => Icons.support_agent,
      };

  @override
  Widget build(BuildContext context) {
    final unread = item.unread > 0;
    final last = item.lastMessage == null
        ? null
        : item.lastAuthor == null
            ? item.lastMessage!
            : '${item.lastAuthor}: ${item.lastMessage}';
    return Material(
      color: HodiColors.cardBackground,
      borderRadius: HodiBorderRadius.card,
      child: InkWell(
        borderRadius: HodiBorderRadius.card,
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: HodiBorderRadius.card,
            boxShadow: HodiShadows.cardLight,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: HodiColors.primaryStart.withValues(alpha: 0.1),
                  borderRadius: HodiBorderRadius.small,
                ),
                child: Icon(_icon, size: 20, color: HodiColors.primaryStart),
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
                            item.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: HodiTextStyles.bodyLarge.copyWith(
                              color: HodiColors.textDark,
                              fontWeight: unread ? FontWeight.w700 : FontWeight.w500,
                            ),
                          ),
                        ),
                        if (item.when != null)
                          Text(DateFormatter.formatTimeOrDate(item.when!),
                              style: HodiTextStyles.bodySmall),
                      ],
                    ),
                    if (item.subtitle != null)
                      Text(item.subtitle!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: HodiTextStyles.bodySmall),
                    if (last != null) ...[
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              last,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: HodiTextStyles.bodyMedium.copyWith(
                                color: unread ? HodiColors.textDark : HodiColors.textMedium,
                              ),
                            ),
                          ),
                          if (unread) ...[
                            const SizedBox(width: 8),
                            _UnreadDot(count: item.unread),
                          ],
                        ],
                      ),
                    ],
                    if (!item.open)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text('Closed · kept on the record',
                            style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight)),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UnreadDot extends StatelessWidget {
  const _UnreadDot({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '$count unread',
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
        constraints: const BoxConstraints(minWidth: 22),
        decoration: BoxDecoration(
          color: HodiColors.primaryStart,
          borderRadius: BorderRadius.circular(11),
        ),
        child: Text(
          count > 99 ? '99+' : '$count',
          textAlign: TextAlign.center,
          style: HodiTextStyles.bodySmall.copyWith(
            color: HodiColors.white,
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
