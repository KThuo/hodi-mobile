import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/stays/providers/stay_providers.dart';

void main() {
  group('the stay search', () {
    test('nights needs both ends', () {
      final from = DateTime(2026, 10, 3);

      expect(const StayQuery().nights, isNull);
      expect(StayQuery(checkIn: from).nights, isNull);
      expect(StayQuery(checkOut: from).nights, isNull);
      expect(StayQuery(checkIn: from, checkOut: DateTime(2026, 10, 7)).nights, 4);
    });

    test('a range that ends where it starts is not a stay', () {
      // Nobody books nought nights, and sending the pair would have the server answer about a
      // window that does not exist.
      final day = DateTime(2026, 10, 3);
      expect(StayQuery(checkIn: day, checkOut: day).nights, isNull);
    });

    test('guests is not counted as a filter somebody set', () {
      // It defaults to a real number rather than to nothing, so counting it would mean the
      // screen offered to "clear 1 filter" on a search nobody had narrowed.
      expect(const StayQuery(guests: 2).activeCount, 0);
    });

    test('everything else is', () {
      final q = StayQuery(
        checkIn: DateTime(2026, 10, 3),
        checkOut: DateTime(2026, 10, 7),
        minBedrooms: 2,
        minBathrooms: 1,
        maxNightly: 8000,
        searchTerm: 'Kilimani',
      );

      expect(q.activeCount, 5);
    });

    test('whitespace is not a search term', () {
      expect(const StayQuery(searchTerm: '   ').activeCount, 0);
    });

    test('copyWith can put a field back to nothing', () {
      // The setters clear as well as set — "Any beds" has to be able to undo "2+". A plain
      // `int?` parameter cannot express that, which is why these take closures.
      const q = StayQuery(minBedrooms: 2, maxNightly: 9000);
      final cleared = q.copyWith(minBedrooms: () => null);

      expect(cleared.minBedrooms, isNull);
      expect(cleared.maxNightly, 9000, reason: 'untouched fields are carried');
    });

    test('the sort survives a filter change, because it is not a filter', () {
      const q = StayQuery(sort: StaySort.mostRoom, minBedrooms: 2);
      expect(q.copyWith(minBedrooms: () => null).sort, StaySort.mostRoom);
    });
  });
}
