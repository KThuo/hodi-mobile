import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/vacate_notices/domain/notice_thread.dart';

/// The conversation on a move-out notice, as the phone reads it.
void main() {
  test('reads messages and events, oldest first, with who wrote them', () {
    final thread = NoticeThread.fromJson({
      'open': true,
      'unread': 1,
      'entries': [
        {'id': 'm1', 'kind': 'EVENT', 'authorName': 'HODI', 'authorRole': 'SYSTEM',
         'body': 'Ann approved the notice.', 'createdOn': '2026-10-14T08:00:00Z',
         'mine': false, 'hasAttachment': false, 'attachmentType': null},
        {'id': 'm2', 'kind': 'MESSAGE', 'authorName': 'Ann', 'authorRole': 'OFFICE',
         'body': 'The damage photo is attached.', 'createdOn': '2026-10-14T09:00:00Z',
         'mine': false, 'hasAttachment': true, 'attachmentType': 'image/jpeg'},
        {'id': 'm3', 'kind': 'MESSAGE', 'authorName': 'Bon', 'authorRole': 'TENANT',
         'body': 'I will pay on Friday.', 'createdOn': '2026-10-14T10:00:00Z',
         'mine': true, 'hasAttachment': false, 'attachmentType': null},
      ],
    });

    expect(thread.entries.map((e) => e.id), ['m1', 'm2', 'm3']);
    expect(thread.entries.first.isEvent, isTrue);
    expect(thread.entries[1].hasAttachment, isTrue);
    expect(thread.entries[1].isPdf, isFalse);
    expect(thread.entries.last.mine, isTrue);
    expect(thread.unread, 1);
  });

  test('a finished notice reads as closed', () {
    final thread = NoticeThread.fromJson({'open': false, 'unread': 0, 'entries': const []});

    expect(thread.open, isFalse);
    expect(thread.entries, isEmpty);
  });
}
