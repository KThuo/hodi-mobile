import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/core/widgets/hodi_status_badge.dart';
import 'package:hodi_mobile/features/houses/domain/house_model.dart';
import 'package:hodi_mobile/features/houses/domain/unit_standing.dart';

/// What a unit says about itself on the list and the detail.
///
/// The phone used to read only `occupied`, so a vacant unit held back for repairs said "Vacant"
/// here while the web said "Unavailable".
void main() {
  final today = DateTime(2026, 10, 16);

  test('a held-back unit reads Unavailable, with why and until when', () {
    final s = UnitStanding.of(
      status: 1,
      occupied: false,
      availability: 'UNAVAILABLE',
      reason: 'REPAIRS',
      note: 'Replacing the sink',
      availableFrom: '2026-11-30',
      today: today,
    );
    expect(s.label, 'Unavailable');
    expect(s.type, BadgeType.error);
    expect(s.detail, 'Repairs · back 30 Nov 2026 · Replacing the sink');
  });

  test('one back on the market by itself asks to be confirmed', () {
    final s = UnitStanding.of(
      status: 1,
      occupied: false,
      reason: 'RENOVATION',
      reviewSince: '2026-10-16',
      today: today,
    );
    expect(s.label, 'Vacant · confirm');
    expect(s.detail, 'Back from renovation on 16 Oct 2026');
  });

  test('suspended comes before everything else', () {
    expect(
      UnitStanding.of(status: 0, occupied: false, availability: 'UNAVAILABLE', today: today).label,
      'Suspended',
    );
  });

  test('a past date is now, not "from"', () {
    final s = UnitStanding.of(status: 1, occupied: false, availableFrom: '2026-10-01', today: today);
    expect(s.label, 'Vacant');
    expect(s.detail, isNull);
  });

  test('the list row reads the new fields', () {
    final h = HouseModel.fromJson({
      'id': 'Xk9aQ2',
      'houseCode': 'B4',
      'occupied': false,
      'status': 1,
      'availability': 'UNAVAILABLE',
      'availabilityReason': 'REPAIRS',
      'availableFrom': '2026-11-30',
      'availabilityReviewSince': null,
    });
    expect(h.availability, 'UNAVAILABLE');
    expect(h.availabilityReason, 'REPAIRS');
    expect(h.availableFrom, '2026-11-30');
  });

  test('a row from before availability still reads as available', () {
    final h = HouseModel.fromJson({'id': 'Xk9aQ2', 'houseCode': 'B4'});
    expect(h.availability, 'AVAILABLE');
  });
}
