import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/metres/domain/metre_history_model.dart';

void main() {
  group('a meter history', () {
    const reply = {
      'year': 2026,
      'years': [2026, 2025],
      'readings': [
        {
          'id': 'aB3xY',
          'meterNo': 'WM-014',
          'chargeName': 'Water',
          'unitLabel': 'm³',
          'previousReading': 1420,
          'currentReading': 1462,
          'consumedUnits': 42,
          'rate': 120,
          'amount': 5040,
          'periodLabel': 'September 2026',
          'hasPhoto': true,
        },
      ],
    };

    test('parses the shape the server actually sends', () {
      // It was parsed as a PagedResponse, looking for `content`. The endpoint answers a
      // ReadingHistory — year, years, readings — so nothing was found and every history was empty
      // while the rows sat in the reply.
      final page = MetreHistoryPage.fromJson(reply);

      expect(page.year, 2026);
      expect(page.years, [2026, 2025]);
      expect(page.readings, hasLength(1));
      expect(page.readings.single.meterNo, 'WM-014');
    });

    test('carries the photo flag, which is what puts the picture on screen', () {
      expect(MetreHistoryPage.fromJson(reply).readings.single.hasPhoto, isTrue);
    });

    test('an empty year is an empty list, not a failure', () {
      final page = MetreHistoryPage.fromJson({
        'year': 2024,
        'years': [2026, 2025],
        'readings': <dynamic>[],
      });

      expect(page.readings, isEmpty);
      expect(page.year, 2024);
      // The year asked for need not be among the years with readings, which is why the picker
      // adds it back.
      expect(page.years, isNot(contains(2024)));
    });

    test('a reply missing its lists does not throw', () {
      final page = MetreHistoryPage.fromJson({'year': 2026});
      expect(page.readings, isEmpty);
      expect(page.years, isEmpty);
    });
  });
}
