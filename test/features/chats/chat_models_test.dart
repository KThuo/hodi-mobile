import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/chats/domain/chat_models.dart';

/// The inbox and a conversation, parsed from what the server sends.
void main() {
  group('the inbox', () {
    test('parses each kind and routes it to its own screen', () {
      final inbox = Inbox.fromJson({
        'unread': 3,
        'items': [
          {
            'kind': 'OFFICE', 'id': 'abc', 'title': 'Estate office', 'subtitle': 'Riverside',
            'lastMessage': 'We have reset it.', 'lastAuthor': 'Mary', 'lastAt': '2026-10-15T09:30:00Z',
            'unread': 2, 'open': true,
          },
          {'kind': 'REPAIR', 'id': 'r1', 'title': 'Repair · sockets', 'unread': 1, 'open': true},
          {'kind': 'VACATE', 'id': 'v1', 'title': 'Move-out · M08', 'unread': 0, 'open': false},
        ],
      });

      expect(inbox.unread, 3);
      expect(inbox.items, hasLength(3));
      expect(inbox.items[0].route, '/more/chats/office/abc');
      expect(inbox.items[0].when, isNotNull);
      expect(inbox.items[1].route, '/more/maintenance/r1');
      expect(inbox.items[2].route, '/more/vacate-notices/v1');
      expect(inbox.items[2].open, isFalse);
      expect(inbox.items[1].lastMessage, isNull);
    });

    test('an empty inbox reads as empty, not as a failure', () {
      final inbox = Inbox.fromJson({'items': <dynamic>[], 'unread': 0});
      expect(inbox.items, isEmpty);
      expect(inbox.unread, 0);
    });
  });

  group('a conversation', () {
    test('parses messages, events and internal notes', () {
      final view = ChatView.fromJson({
        'id': 'r1',
        'kind': 'REPAIR',
        'title': 'Repair · sockets',
        'subtitle': 'Riverside · M08',
        'open': true,
        'myRole': 'OFFICE',
        'unread': 1,
        'entries': [
          {
            'id': 'u1', 'kind': 'MESSAGE', 'authorName': 'Jane', 'authorRole': 'TENANT',
            'body': 'Sockets failing', 'at': '2026-10-15T08:00:00Z', 'mine': false,
            'hasAttachment': false, 'internal': false,
          },
          {
            'id': 'u2', 'kind': 'EVENT', 'authorName': 'Mary', 'authorRole': 'SYSTEM',
            'body': 'Mary: marked assigned', 'at': '2026-10-15T08:10:00Z', 'mine': false,
            'hasAttachment': false, 'internal': false,
          },
          {
            'id': 'u3', 'kind': 'MESSAGE', 'authorName': 'Mary', 'authorRole': 'OFFICE',
            'body': 'Tenant was rude.', 'at': '2026-10-15T08:20:00Z', 'mine': true,
            'hasAttachment': true, 'attachmentType': 'application/pdf', 'internal': true,
          },
        ],
      });

      expect(view.myRole, 'OFFICE');
      expect(view.entries, hasLength(3));
      expect(view.entries[0].isEvent, isFalse);
      expect(view.entries[1].isEvent, isTrue);
      expect(view.entries[2].internal, isTrue);
      expect(view.entries[2].isPdf, isTrue);
      expect(view.entries[2].when, isNotNull);
    });

    test('a missing field takes a safe default', () {
      final entry = ChatEntry.fromJson({'id': 'x'});
      expect(entry.kind, 'MESSAGE');
      expect(entry.authorRole, 'SYSTEM');
      expect(entry.body, '');
      expect(entry.internal, isFalse);
      expect(entry.when, isNull);
    });
  });
}
