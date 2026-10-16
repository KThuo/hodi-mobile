import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/theme/hodi_border_radius.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_shadows.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/photo_picker_row.dart';
import '../../domain/chat_models.dart';

/// What a conversation needs from whoever owns it: how to read it, how to write in it.
///
/// The move-out notice, the repair and the office conversation each have their own addresses and
/// rules; this is the one place that knows what a chat looks like.
class ChatSource {
  const ChatSource({
    required this.load,
    required this.send,
    this.openFile,
    this.photoMax = 1,
    this.allowInternal = false,
    this.canWrite = true,
  });

  /// The conversation, or null when it could not be read. Reading marks it read.
  final Future<ChatView?> Function() load;

  /// Writes a message. [internal] is only ever true where [allowInternal] offered it. Throws with
  /// a message worth showing.
  final Future<void> Function(String text, List<XFile> photos, bool internal) send;

  /// Opens an attachment in the phone's own viewer; null where the conversation has none.
  final Future<void> Function(ChatEntry entry)? openFile;

  /// Photos per message, or 0 for none.
  final int photoMax;

  /// Whether the office may mark a message for the office only.
  final bool allowInternal;

  /// False for somebody who may read the conversation but not write in it.
  final bool canWrite;
}

/// A conversation between a tenant and the office, drawn as a chat.
///
/// A trail: nothing here edits or deletes a message, and what happened — approved, assigned,
/// resolved — sits in the same history as small centred lines. Re-read every twenty seconds while
/// the screen is open and when the app comes back to the front; no push service. Reading it marks it
/// read, which is what lets the other side's next reply reach the tenant by SMS.
class ChatThreadCard extends StatefulWidget {
  const ChatThreadCard({
    super.key,
    required this.source,
    this.title = 'Conversation',
    required this.intro,
    required this.empty,
    required this.closed,
    this.hint = 'Write a message',
    this.extraFor,
    this.onSent,
    this.framed = true,
  });

  final ChatSource source;
  final String title;

  /// One line under the title: who this is with, and why it is kept.
  final String intro;

  /// Said when there is nothing yet: what this conversation is for.
  final String empty;

  /// Said instead of the composer once the conversation takes no more messages.
  final String closed;
  final String hint;

  /// Anything to show under a message — a repair's photos on the comment they came with.
  final List<Widget> Function(ChatEntry entry)? extraFor;

  /// After a message is sent, for a screen with figures of its own to re-read.
  final VoidCallback? onSent;

  /// In a card, or bare for a screen that is nothing but the conversation.
  final bool framed;

  @override
  State<ChatThreadCard> createState() => _ChatThreadCardState();
}

class _ChatThreadCardState extends State<ChatThreadCard> with WidgetsBindingObserver {
  static const _poll = Duration(seconds: 20);

  ChatView? _view;
  bool _failed = false;
  bool _sending = false;
  bool _internal = false;
  final _draft = TextEditingController();
  List<XFile> _photos = const [];
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
    final view = await widget.source.load();
    if (!mounted) return;
    setState(() {
      if (view != null) {
        _view = view;
        _failed = false;
      } else {
        _failed = _view == null;
      }
    });
  }

  Future<void> _send() async {
    final text = _draft.text.trim();
    if (text.isEmpty || _sending) return;
    setState(() => _sending = true);
    try {
      await widget.source.send(text, _photos, _internal);
      _draft.clear();
      setState(() {
        _photos = const [];
        _internal = false;
      });
      await _load();
      widget.onSent?.call();
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

  Future<void> _open(ChatEntry e) async {
    final open = widget.source.openFile;
    if (open == null) return;
    try {
      await open(e);
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
    final view = _view;
    final office = view?.myRole == 'OFFICE';
    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.framed) ...[
          Row(
            children: [
              Icon(Icons.forum_outlined, size: 20, color: HodiColors.primaryStart),
              const SizedBox(width: 8),
              Text(widget.title, style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 2),
          Text(widget.intro, style: HodiTextStyles.bodySmall),
          const SizedBox(height: 12),
        ],
        if (_failed)
          Text('The conversation could not be loaded.', style: HodiTextStyles.bodySmall)
        else if (view == null)
          const Center(
              child: SizedBox(
                  width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)))
        else ...[
          if (view.entries.isEmpty) Text(widget.empty, style: HodiTextStyles.bodySmall),
          for (final e in view.entries)
            e.isEvent
                ? ChatEventLine(entry: e)
                : ChatBubble(
                    entry: e,
                    onOpen: widget.source.openFile == null ? null : _open,
                    extra: widget.extraFor?.call(e) ?? const [],
                  ),
          const SizedBox(height: 8),
          if (view.open && widget.source.canWrite) ...[
            if (widget.source.photoMax > 0)
              PhotoPickerRow(
                photos: _photos,
                max: widget.source.photoMax,
                onChanged: (list) => setState(() => _photos = list),
              ),
            if (widget.source.allowInternal && office)
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                dense: true,
                value: _internal,
                onChanged: (v) => setState(() => _internal = v),
                title: Text('Only the office sees this', style: HodiTextStyles.bodyMedium),
                subtitle: Text('A note the tenant is not shown.', style: HodiTextStyles.bodySmall),
              ),
            const SizedBox(height: 8),
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
                      hintText: _internal ? 'A note for the office' : widget.hint,
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
            ),
          ] else if (!view.open)
            Text(widget.closed, style: HodiTextStyles.bodySmall),
        ],
      ],
    );

    if (!widget.framed) return body;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
      ),
      child: body,
    );
  }
}

/// Something that happened, centred between the messages.
class ChatEventLine extends StatelessWidget {
  const ChatEventLine({super.key, required this.entry});

  final ChatEntry entry;

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
            entry.internal ? '${entry.body} · internal' : entry.body,
            textAlign: TextAlign.center,
            style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textMedium),
          ),
        ),
      ),
    );
  }
}

/// One message: mine on the right, theirs on the left, an internal note marked as one.
class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.entry, this.onOpen, this.extra = const []});

  final ChatEntry entry;
  final Future<void> Function(ChatEntry)? onOpen;
  final List<Widget> extra;

  /// Who wrote it, as the reader would say it: "You", "Jane · office", or the tenant's name.
  String get _who {
    if (entry.mine) return 'You';
    final name = entry.authorName;
    if (entry.authorRole == 'OFFICE') return '${name ?? 'The office'} · office';
    return name ?? 'The tenant';
  }

  @override
  Widget build(BuildContext context) {
    final mine = entry.mine;
    final when = entry.when == null ? '' : ' · ${DateFormatter.formatDateTime(entry.when!)}';
    return Align(
      alignment: mine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.72),
        decoration: BoxDecoration(
          color: entry.internal
              ? HodiColors.warningStart.withValues(alpha: 0.10)
              : mine
                  ? HodiColors.brandSoft
                  : HodiColors.surfaceLight,
          borderRadius: HodiBorderRadius.small,
          border: entry.internal
              ? Border.all(color: HodiColors.warningStart.withValues(alpha: 0.4))
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text('$_who$when',
                      style: HodiTextStyles.bodySmall
                          .copyWith(fontSize: 10, color: HodiColors.textLight)),
                ),
                if (entry.internal) ...[
                  const SizedBox(width: 6),
                  Text('Internal',
                      style: HodiTextStyles.bodySmall.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: HodiColors.warningStart)),
                ],
              ],
            ),
            const SizedBox(height: 2),
            Text(entry.body, style: HodiTextStyles.bodyMedium.copyWith(color: HodiColors.textDark)),
            if (entry.hasAttachment && onOpen != null)
              TextButton.icon(
                style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: const Size(0, 32)),
                onPressed: () => onOpen!(entry),
                icon: const Icon(Icons.attach_file, size: 16),
                label: Text(entry.isPdf ? 'Open the PDF' : 'Open the photo'),
              ),
            if (extra.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Wrap(spacing: 6, runSpacing: 6, children: extra),
              ),
          ],
        ),
      ),
    );
  }
}
