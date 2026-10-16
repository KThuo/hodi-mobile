import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../chats/domain/chat_models.dart';
import '../../../chats/presentation/widgets/chat_thread_card.dart';
import '../../domain/notice_thread.dart';
import '../../providers/vacate_notice_providers.dart';

/// The conversation on a move-out notice, between the tenant and the office.
///
/// Drawn by [ChatThreadCard], like the repair and the office conversation, so the three read the
/// same way; what is particular to a notice is only where it is read from and written to. One
/// photo per message — a picture of the damage, a bank slip.
class NoticeThreadCard extends ConsumerWidget {
  const NoticeThreadCard({super.key, required this.noticeId});

  final String noticeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.read(vacateNoticeRepositoryProvider);
    return ChatThreadCard(
      intro: 'With the office, kept on the record with your notice.',
      empty: 'No messages yet. Ask about your move-out date, deposit or deductions here.',
      closed: 'This notice is finished. The conversation stays on the record.',
      hint: 'Write to the office',
      source: ChatSource(
        load: () async {
          final response = await repo.thread(noticeId);
          final thread = response.data;
          if (!response.isSuccess || thread == null) return null;
          return ChatView(
            id: noticeId,
            kind: 'VACATE',
            entries: [for (final e in thread.entries) _asChat(e)],
            open: thread.open,
            unread: thread.unread,
          );
        },
        send: (text, photos, _) =>
            repo.postToThread(noticeId, text, photo: photos.isEmpty ? null : photos.first),
        openFile: (e) => repo.openThreadFile(noticeId, e.id, pdf: e.isPdf),
      ),
    );
  }

  static ChatEntry _asChat(ThreadEntry e) => ChatEntry(
        id: e.id,
        kind: e.kind,
        authorName: e.authorName,
        authorRole: e.authorRole,
        body: e.body,
        at: e.createdOn?.toUtc().toIso8601String(),
        mine: e.mine,
        hasAttachment: e.hasAttachment,
        attachmentType: e.attachmentType,
      );
}
