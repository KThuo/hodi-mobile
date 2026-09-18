import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/core/filters/filter_option.dart';

void main() {
  group('the switcher options', () {
    test('read label, which is what the server calls it', () {
      // `TenancyModels.Option` is `{id, label}`. This read `name`, so every entry came back
      // blank — a dropdown of empty rows that still filtered correctly when tapped.
      final option = FilterOption.fromJson({'id': 'aB3xY', 'label': 'Kilimani Heights'});

      expect(option.id, 'aB3xY');
      expect(option.label, 'Kilimani Heights');
      expect(option.usable, isTrue);
    });

    test('accept name as well, where that is the spelling that arrived', () {
      expect(FilterOption.fromJson({'id': 'x1', 'name': 'Westlands'}).label, 'Westlands');
    });

    test('an entry with nothing to show is not usable', () {
      expect(FilterOption.fromJson({'id': 'x1', 'label': ''}).usable, isFalse);
      expect(FilterOption.fromJson({'id': '', 'label': 'Ghost'}).usable, isFalse);
    });

    test('the id survives whatever shape it arrived in', () {
      // Hashed ids are strings, but a legacy row could still send a number.
      expect(FilterOption.fromJson({'id': 42, 'label': 'Old'}).id, '42');
    });
  });
}
