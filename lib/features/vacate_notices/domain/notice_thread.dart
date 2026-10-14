/// The conversation on a vacate notice, between the tenant and the office.
///
/// Hand-written rather than generated: two small read-only shapes.
library;

class ThreadEntry {
  final String id;

  /// MESSAGE, or EVENT — something the notice itself recorded.
  final String kind;
  final String? authorName;

  /// TENANT, OFFICE or SYSTEM.
  final String authorRole;
  final String body;
  final DateTime? createdOn;
  final bool mine;
  final bool hasAttachment;
  final String? attachmentType;

  const ThreadEntry({
    required this.id,
    required this.kind,
    required this.authorName,
    required this.authorRole,
    required this.body,
    required this.createdOn,
    required this.mine,
    required this.hasAttachment,
    required this.attachmentType,
  });

  bool get isEvent => kind == 'EVENT';
  bool get isPdf => attachmentType == 'application/pdf';

  factory ThreadEntry.fromJson(Map<String, dynamic> json) => ThreadEntry(
        id: json['id'] as String,
        kind: (json['kind'] as String?) ?? 'MESSAGE',
        authorName: json['authorName'] as String?,
        authorRole: (json['authorRole'] as String?) ?? 'SYSTEM',
        body: (json['body'] as String?) ?? '',
        createdOn: DateTime.tryParse((json['createdOn'] as String?) ?? '')?.toLocal(),
        mine: json['mine'] == true,
        hasAttachment: json['hasAttachment'] == true,
        attachmentType: json['attachmentType'] as String?,
      );
}

class NoticeThread {
  final List<ThreadEntry> entries;

  /// False once the notice is closed, rejected or cancelled: readable, no new messages.
  final bool open;
  final int unread;

  const NoticeThread({required this.entries, required this.open, required this.unread});

  factory NoticeThread.fromJson(Map<String, dynamic> json) => NoticeThread(
        entries: ((json['entries'] as List?) ?? const [])
            .map((e) => ThreadEntry.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList(),
        open: json['open'] == true,
        unread: (json['unread'] as num?)?.toInt() ?? 0,
      );
}
