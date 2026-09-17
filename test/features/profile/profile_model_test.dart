import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/profile/domain/profile_model.dart';

/// Reading the signed-in person off `GET /auth/me`.
///
/// This model was the last one still on the legacy shape, and it failed in the worst way
/// available: `id` was declared `int?` against a `@HashId Long`, which serialises as a string, so
/// `fromJson` threw on every single load and the profile page could never render. Every other
/// field but three also had the wrong name, so fixing the type alone would have produced a page
/// of "N/A".
void main() {
  // The shape of AuthModels.MeResponse.
  const me = <String, dynamic>{
    'id': 'MqemPV9ynW',
    'username': 'jane',
    'fullName': 'Jane Mwangi',
    'firstName': 'Jane',
    'email': 'jane@example.invalid',
    'phone': '254700111222',
    'userType': 'ADMIN',
    'userTypeName': 'Estate Admin',
    'estateName': 'Kilimani',
    'bankName': null,
    'bankLogoUrl': null,
    'userGroupName': 'Estate Admins',
    'estateId': 'p8bP5wdv5a',
    'bankId': null,
    'authorities': ['ROLE_DASHBOARD_VIEW', 'ROLE_HOUSE_VIEW'],
    'superadmin': false,
    'bankadmin': false,
    'admin': true,
    'caretaker': false,
    'tenant': false,
    'mustChangePassword': false,
    'showFieldHints': true,
    'showTileCharts': true,
    'pinSet': true,
  };

  test('it parses a real MeResponse at all', () {
    // The regression this file exists for. `int? id` against a hashed string threw
    // "type 'String' is not a subtype of type 'num?'" before anything else could happen.
    expect(() => ProfileModel.fromJson(me), returnsNormally);
  });

  test('ids are opaque strings', () {
    final profile = ProfileModel.fromJson(me);

    expect(profile.id, 'MqemPV9ynW');
    expect(profile.estateId, 'p8bP5wdv5a');
  });

  test('the names the legacy model asked for are not the names sent', () {
    final profile = ProfileModel.fromJson(me);

    expect(profile.fullName, 'Jane Mwangi');
    expect(profile.userType, 'ADMIN');
    expect(profile.estateName, 'Kilimani');
    expect(profile.userGroupName, 'Estate Admins');
  });

  test('the role is shown in words, and falls back to the code', () {
    // The header showed the code until the rebuild, which labelled everybody in shouting capitals
    // with a string meant for a switch statement.
    expect(ProfileModel.fromJson(me).roleLabel, 'Estate Admin');
    expect(
      ProfileModel.fromJson({...me, 'userTypeName': null}).roleLabel,
      'ADMIN',
    );
  });

  test('who somebody is comes from the server, not from matching on the code', () {
    final tenant = ProfileModel.fromJson(
      {...me, 'userType': 'TENANT', 'tenant': true, 'admin': false},
    );

    // The old screen decided this with `usertype?.toLowerCase() == 'tenant'`, which is a string
    // match on a code the server owns and had already stopped sending in that case.
    expect(tenant.tenant, isTrue);
    expect(ProfileModel.fromJson(me).tenant, isFalse);
  });

  test('initials survive a single name and an empty one', () {
    expect(ProfileModel.fromJson(me).initials, 'JM');
    expect(ProfileModel.fromJson({...me, 'fullName': 'Prince'}).initials, 'P');
    expect(ProfileModel.fromJson({...me, 'fullName': '  '}).initials, '?');
    expect(ProfileModel.fromJson({...me, 'fullName': null}).initials, '?');
  });

  test('a name with two spaces in it does not index into nothing', () {
    // 'Jane  Mwangi'.split(' ') yields ['Jane', '', 'Mwangi'], and parts[1][0] on the empty
    // string is a RangeError — which would have been the next way this page failed to open.
    expect(ProfileModel.fromJson({...me, 'fullName': 'Jane  Mwangi'}).initials, 'JM');
  });

  test('a display name is always something', () {
    expect(ProfileModel.fromJson(me).displayName, 'Jane Mwangi');
    expect(
      ProfileModel.fromJson({...me, 'fullName': null}).displayName,
      'jane',
      reason: 'the username, rather than a blank header',
    );
  });
}
