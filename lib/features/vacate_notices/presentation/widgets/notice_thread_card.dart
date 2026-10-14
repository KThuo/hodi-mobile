import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/hodi_border_radius.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_shadows.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../domain/notice_thread.dart';
import '../../providers/vacate_notice_providers.dart';

/// The conversation on a move-out notice, between the tenant and the office.
///
/// A trail: nothing here edits or deletes a message, and the notice's own events — approved,
/// settled, paid, closed — sit in the same thread. Re-read every twenty seconds while the screen is
/// open and when the app comes back to the front; no push service. Reading it marks it read, which
/// is what lets the office's next reply reach the tenant by SMS.
class NoticeThreadCard extends ConsumerStatefulWidget {
  const NoticeThreadCard({super.key, required this.noticeId});

  final String noticeId;

  @override
  ConsumerState<NoticeThreadCard> createState() => _NoticeThreadCardState();
}

class _NoticeThreadCardState extends ConsumerState<NoticeThreadCard>
    with WidgetsBindingObserver {
  static const _poll = Duration(seconds: 20);

  NoticeThread? _thread;
  bool _failed = false;
  bool _sending = false;
  final _draft = TextEditingController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _load();
    _timer = Timer.periodic(_poll, (_) => _load());
  }

  @override
  void dispose() {
    _timer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    _draft.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) _load();
  }

  Future<void> _load() async {
    final response =
        await ref.read(vacateNoticeRepositoryProvider).thread(widget.noticeId);
    if (!mounted) return;
    setState(() {
      if (response.isSuccess && response.data != null) {
        _thread = response.data;
        _failed = false;
      } else {
        _failed = _thread == null;
      }
    });
  }

  Future<void> _send() async {
    final text = _draft.text.trim();
    if (text.isEmpty || _sending) return;
    setState(() => _sending = true);
    try {
      await ref.read(vacateNoticeRepositoryProvider).postToThread(widget.noticeId, text);
      _draft.clear();
      await _load();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString().replaceFirst('Exception: ', '')),
        backgroundColor: HodiColors.errorStart,
      ));
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  Future<void> _open(ThreadEntry e) async {
    try {
      await ref
          .read(vacateNoticeRepositoryProvider)
          .openThreadFile(widget.noticeId, e.id, pdf: e.isPdf);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('That attachment could not be opened.'),
        backgroundColor: HodiColors.errorStart,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final thread = _thread;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.forum_outlined, size: 20, color: HodiColors.primaryStart),
              const SizedBox(width: 8),
              Text('Conversation', style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 2),
          Text('With the office, kept on the record with your notice.',
              style: HodiTextStyles.bodySmall),
          const SizedBox(height: 12),
          if (_failed)
            Text('The conversation could not be loaded.', style: HodiTextStyles.bodySmall)
          else if (thread == null)
            const Center(
                child: SizedBox(
                    width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)))
          else ...[
            if (thread.entries.isEmpty)
              Text(
                'No messages yet. Ask about your move-out date, deposit or deductions here.',
                style: HodiTextStyles.bodySmall,
              ),
            for (final e in thread.entries) e.isEvent ? _Event(entry: e) : _Bubble(entry: e, onOpen: _open),
            const SizedBox(height: 8),
            if (thread.open)
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _draft,
                      minLines: 1,
                      maxLines: 5,
                      maxLength: 2000,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        hintText: 'Write to the office',
                        counterText: '',
                        isDense: true,
                        border: OutlineInputBorder(borderRadius: HodiBorderRadius.small),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton.filled(
                    onPressed: _sending ? null : _send,
                    icon: _sending
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                        : const Icon(Icons.send),
                    tooltip: 'Send',
                  ),
                ],
              )
            else
              Text('This notice is finished. The conversation stays on the record.',
                  style: HodiTextStyles.bodySmall),
          ],
        ],
      ),
    );
  }
}

class _Event extends StatelessWidget {
  const _Event({required this.entry});

  final ThreadEntry entry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: HodiColors.surfaceLight,
            borderRadius: HodiBorderRadius.full,
          ),
          child: Text(
            entry.body,
            textAlign: TextAlign.center,
            style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textMedium),
          ),
        ),
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({required this.entry, required this.onOpen});

  final ThreadEntry entry;
  final Future<void> Function(ThreadEntry) onOpen;

  @override
  Widget build(BuildContext context) {
    final mine = entry.mine;
    final when = entry.createdOn == null ? '' : DateFormatter.formatDateTime(entry.createdOn!);
    final who = mine ? 'You' : '${entry.authorName ?? 'The office'} · office';
    return Align(
      alignment: mine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.72),
        decoration: BoxDecoration(
          color: mine ? HodiColors.brandSoft : HodiColors.surfaceLight,
          borderRadius: HodiBorderRadius.small,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$who · $when',
                style: HodiTextStyles.bodySmall.copyWith(fontSize: 10, color: HodiColors.textLight)),
            const SizedBox(height: 2),
            Text(entry.body, style: HodiTextStyles.bodyMedium.copyWith(color: HodiColors.textDark)),
            if (entry.hasAttachment)
              TextButton.icon(
                style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: const Size(0, 32)),
                onPressed: () => onOpen(entry),
                icon: const Icon(Icons.attach_file, size: 16),
                label: Text(entry.isPdf ? 'Open the PDF' : 'Open the photo'),
              ),
          ],
        ),
      ),
    );
  }
}
