import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/analytics/domain/analytics_models.dart';

/// The three analytics shapes the dashboard reads.
///
/// Mostly about keeping the server's answer: a rate that has no denominator stays null rather than
/// becoming 0%, and the cards drop what the web page would not show — an unranked tenancy is not
/// somebody to chase, and a property with no rent roll has no realised share to draw.
void main() {
  const window = {'label': 'Nov 2025 – Oct 2026'};

  Map<String, dynamic> tenant(String name, {int? rank, bool ranked = true}) => {
        'id': 'occ$name',
        'tenantUserId': 'usr$name',
        'tenantName': name,
        'unitLabel': 'A1 (Ground Floor)',
        'propertyName': 'Joyland',
        'owed': 5800,
        'onTimeRate': 50.0,
        'onTime': 1,
        'dueInvoices': 2,
        'medianDaysToPay': 9,
        'rank': rank,
        'ranked': ranked,
      };

  group('tenants to chase', () {
    test('keeps the ranked, worst first as sent, and drops the too-new', () {
      final page = TenantsToChase.fromJson({
        'window': window,
        'tenancies': 66,
        'content': [
          tenant('Bon', rank: 50),
          tenant('Esther', rank: 49),
          tenant('Linda', rank: null, ranked: false),
        ],
      });

      expect(page.tenants.map((t) => t.tenantName), ['Bon', 'Esther']);
      expect(page.tenancies, 66);
      expect(page.windowLabel, 'Nov 2025 – Oct 2026');
    });

    test('reads money and counts that arrive as whole numbers', () {
      final t = TenantToChase.fromJson(tenant('Bon', rank: 50));

      expect(t.owed, 5800.0);
      expect(t.onTime, 1);
      expect(t.dueInvoices, 2);
      expect(t.medianDaysToPay, 9);
      expect(t.tenantUserId, 'usrBon');
    });

    test('nobody ever paid is no days to pay, not zero', () {
      final t = TenantToChase.fromJson({...tenant('Bon', rank: 50), 'medianDaysToPay': null, 'onTimeRate': null});

      expect(t.medianDaysToPay, isNull);
      expect(t.onTimeRate, isNull);
    });
  });

  group('rent realised', () {
    Map<String, dynamic> property(String name, double? rate, {double roll = 100000}) => {
          'id': 'prop$name',
          'propertyName': name,
          'estateName': 'Westlands',
          'realisedRate': rate,
          'realisation': {'rentRoll': roll, 'rentCollected': (rate ?? 0) * roll / 100},
        };

    test('best first, and a property with no rent roll is left off', () {
      final view = RentRealised.fromJson({
        'window': window,
        'content': [
          property('Delta', 48.0),
          property('Joyland', 60.2),
          property('Baobab', null, roll: 0),
        ],
        'realisation': {'rentRoll': 200000, 'rentCollected': 108200, 'realisedRate': 54.1},
      });

      expect(view.properties.map((p) => p.propertyName), ['Joyland', 'Delta']);
      expect(view.realisedRate, 54.1);
      expect(view.rentRoll, 200000);
    });

    test('no rental units at all is no realised share, not nought per cent', () {
      final view = RentRealised.fromJson({
        'window': window,
        'content': const [],
        'realisation': {'rentRoll': 0, 'rentCollected': 0, 'realisedRate': null},
      });

      expect(view.properties, isEmpty);
      expect(view.realisedRate, isNull);
    });
  });

  group('HODI Stays', () {
    test('the ratios are the server\'s', () {
      final stays = StaysSummary.fromJson({
        'window': window,
        'units': 2,
        'nights': 20,
        'available': 60,
        'revenue': 100000,
        'occupancyRate': 33.3,
        'adr': 5000.0,
        'revpar': 1666.67,
      });

      expect(stays.units, 2);
      expect(stays.occupancyRate, 33.3);
      expect(stays.adr, 5000.0);
      expect(stays.revpar, 1666.67);
    });

    test('no Stays units reads as none, which hides the card', () {
      final stays = StaysSummary.fromJson({
        'window': window,
        'units': 0,
        'nights': 0,
        'available': 0,
        'revenue': 0,
        'occupancyRate': null,
        'adr': null,
        'revpar': null,
      });

      expect(stays.units, 0);
      expect(stays.adr, isNull);
    });
  });
}
