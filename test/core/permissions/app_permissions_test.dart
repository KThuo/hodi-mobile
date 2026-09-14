import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/core/permissions/app_permissions.dart';

/// Every authority the app names must be one the backend grants.
///
/// ## Why this test exists
///
/// When HODI was rebuilt, twenty-five of the app's twenty-six permission strings were renamed —
/// `ROLE_PROPERTIES_VIEW` became `ROLE_PROPERTY_VIEW`, and so on down the list. **Nothing about that
/// failed.** A gate testing an authority nobody holds hides its child, so the app did not error: it
/// quietly had no features, which is the kind of bug that reaches a caretaker in the field rather
/// than a build.
///
/// So the spelling is asserted rather than trusted. If the backend renames one again, this fails on
/// the next regeneration of the fixture instead of being found by somebody who cannot open a screen.
///
/// ## Regenerating the fixture
///
/// ```sh
/// {
///   echo "# Every authority the HODI backend defines, one per line."
///   echo "# Generated from hodi-b — regenerate with the command in this file."
///   docker exec -i postgres psql -U postgres -d hodi -tAc \
///     "select authority from permissions where status <> 2 order by authority"
/// } > test/fixtures/backend_authorities.txt
/// ```
///
/// It is a snapshot, and that is the point: it changes in a commit somebody reviews, next to the
/// app change that goes with it.
void main() {
  late Set<String> backend;

  setUpAll(() {
    backend = File('test/fixtures/backend_authorities.txt')
        .readAsLinesSync()
        .map((l) => l.trim())
        .where((l) => l.isNotEmpty && !l.startsWith('#'))
        .toSet();
  });

  test('the fixture was actually loaded', () {
    // Without this, an empty or missing file would make every assertion below pass vacuously —
    // which is exactly the failure mode this whole test exists to prevent.
    expect(backend, isNotEmpty);
    expect(backend, contains('ROLE_DASHBOARD_VIEW'));
  });

  test('every authority the app names exists on the backend', () {
    final unknown = AppPermissions.all.where((a) => !backend.contains(a)).toList();

    expect(
      unknown,
      isEmpty,
      reason: 'These are spelt in a way the backend does not know, so any gate gated on them '
          'silently hides its screen: ${unknown.join(', ')}',
    );
  });

  test('the list is the whole vocabulary, with nothing named twice', () {
    expect(AppPermissions.all.toSet().length, AppPermissions.all.length,
        reason: 'a duplicate means one of them is dead and nobody would notice');
  });

  test('the plural forms the rebuild removed do not creep back', () {
    // The exact strings the app used to hold. Named rather than pattern-matched, because the point
    // is these specific mistakes, and a pattern would also catch legitimate names like ROLE_ESTATES.
    const gone = [
      'ROLE_PROPERTIES_VIEW', 'ROLE_HOUSES_VIEW', 'ROLE_METRES_VIEW',
      'ROLE_TENANTS_VIEW', 'ROLE_PAYMENTS_VIEW', 'ROLE_EXPENSES_VIEW',
      'ROLE_EXPENDITURES_VIEW', 'ROLE_REPORTS_VIEW', 'ROLE_VACATE_NOTICES_VIEW',
      'ROLE_ESTATES_VIEW', 'ROLE_TENANT_ACCESS_VIEW',
    ];
    for (final old in gone) {
      expect(AppPermissions.all, isNot(contains(old)));
      expect(backend, isNot(contains(old)),
          reason: '$old is back on the backend; this test is out of date, not the app');
    }
  });
}
