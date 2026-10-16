import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/hodi_colors.dart';
import '../../../core/widgets/hodi_app_bar.dart';
import '../domain/chat_models.dart';
import '../providers/chat_providers.dart';
import 'widgets/chat_thread_card.dart';

/// Contact admin: a tenant's standing conversation with their estate office.
///
/// One per tenant per estate, so it is the same history every time it is opened. The tenant sees
/// "Estate office"; the office sees the tenant's name. It never closes.
class OfficeChatScreen extends ConsumerStatefulWidget {
  const OfficeChatScreen({super.key, required this.id});

  final String id;

  @override
  ConsumerState<OfficeChatScreen> createState() => _OfficeChatScreenState();
}

class _OfficeChatScreenState extends ConsumerState<OfficeChatScreen> {
  /// Taken from the conversation once it is read, so the bar says who this is with.
  String _title = 'Estate office';

  Future<ChatView?> _load() async {
    final response = await ref.read(chatRepositoryProvider).office(widget.id);
    final view = response.data;
    if (!response.isSuccess || view == null) return null;
    if (mounted && view.title.isNotEmpty && view.title != _title) {
      setState(() => _title = view.title);
    }
    return view;
  }

  @override
  Widget build(BuildContext context) {
    final repo = ref.read(chatRepositoryProvider);
    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: HodiAppBar(title: _title),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ChatThreadCard(
            title: 'Conversation',
            intro: 'Between the tenant and the estate office, kept on the record.',
            empty: 'No messages yet. Ask the office anything — a key, a noise, a charge.',
            closed: 'This conversation takes no more messages.',
            hint: 'Write a message',
            source: ChatSource(
              load: _load,
              send: (text, photos, _) =>
                  repo.postToOffice(widget.id, text, photo: photos.isEmpty ? null : photos.first),
              openFile: (e) => repo.openOfficeFile(widget.id, e.id, pdf: e.isPdf),
            ),
          ),
        ],
      ),
    );
  }
}
