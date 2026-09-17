import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/notifications/domain/notification_model.dart';

/// Reading the inbox.
///
/// The field worth testing is `route`. It is a path the **web** router understands, and the app
/// does not carry every page the browser does — so following it blindly lands somebody on a screen
/// that does not exist, which reads as the notification being broken rather than the app being
/// smaller than the website.
void main() {
  const row = <String, dynamic>{
    'id': 'MqemPV9ynW',
    'template': 'INVOICE_RAISED',
    'title': 'September rent',
    'body': 'Your invoice for September 2026 is ready.',
    'route': '/billing/invoices/HPABACMLPVNH',
    'actionLabel': 'View invoice',
    'read': false,
    'readOn': null,
    'createdOn': '2026-09-01T06:00:00Z',
  };

  test('it reads the row', () {
    final n = NotificationModel.fromJson(row);

    expect(n.id, 'MqemPV9ynW');
    expect(n.body, 'Your invoice for September 2026 is ready.');
    expect(n.read, isFalse);
  });

  group('the heading', () {
    test('is the title where there is one', () {
      expect(NotificationModel.fromJson(row).heading, 'September rent');
    });

    test('falls back to the template in words, never to nothing', () {
      final untitled =
          NotificationModel.fromJson({...row, 'title': null});

      expect(untitled.heading, 'Invoice raised');
    });

    test('survives a row with neither', () {
      expect(
        NotificationModel.fromJson({...row, 'title': null, 'template': null}).heading,
        'Notification',
      );
    });
  });

  group('the route', () {
    test('a web invoice path becomes the app one', () {
      final n = NotificationModel.fromJson(row);

      expect(n.mobileRoute, '/invoices/HPABACMLPVNH');
      expect(n.canOpen, isTrue);
    });

    test('a receipt path becomes the app one', () {
      final n = NotificationModel.fromJson(
        {...row, 'route': '/payments/receipts/UHR0Y46U0Q'},
      );

      expect(n.mobileRoute, '/payments/UHR0Y46U0Q');
    });

    test('a module the app does not carry offers no tap', () {
      // The web has pages for penalties, leases, estate billing and more. Guessing at a
      // translation produces a tap that lands on "not found".
      for (final route in const [
        '/penalties',
        '/estatebilling/invoices/EB1',
        '/admin/users',
        '/reports/rent',
      ]) {
        final n = NotificationModel.fromJson({...row, 'route': route});
        expect(n.mobileRoute, isNull, reason: route);
        expect(n.canOpen, isFalse, reason: route);
      }
    });

    test('no route at all is not an error', () {
      final n = NotificationModel.fromJson({...row, 'route': null});

      expect(n.mobileRoute, isNull);
      expect(n.canOpen, isFalse);
      // Still perfectly readable, which is the point.
      expect(n.body, isNotEmpty);
    });

    test('maintenance and visits reach their lists', () {
      expect(
        NotificationModel.fromJson({...row, 'route': '/maintenance/requests/9'}).mobileRoute,
        '/more/maintenance',
      );
      expect(
        NotificationModel.fromJson({...row, 'route': '/visitors'}).mobileRoute,
        '/more/visitors',
      );
    });
  });
}
