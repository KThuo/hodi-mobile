import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/maintenance/domain/maintenance_models.dart';

/// Reading a repair.
///
/// `RequestRow` has fifty fields and this model carries about half — the part the app's two
/// audiences act on. The tests below are about the handful of decisions in that cut rather than
/// about every field arriving.
void main() {
  const row = <String, dynamic>{
    'id': 'MqemPV9ynW',
    'requestRef': 'MR-000412',
    'propertyName': 'Kilimani Heights',
    'houseCode': 'B4',
    'houseNumber': 'K04',
    'reporterName': 'Test Onboard',
    'categoryName': 'Plumbing',
    'title': 'Kitchen tap will not close',
    'description': 'Dripping since Sunday, getting worse.',
    'priority': 'HIGH',
    'status': 'IN_PROGRESS',
    'statusLabel': 'In progress',
    'assigneeName': 'Peter Otieno',
    'submittedOn': '2026-09-01T06:00:00Z',
    'dueOn': '2026-09-03T06:00:00Z',
    'dueLabel': 'in 2 days',
    'slaBreached': false,
    'late': false,
    'open': true,
  };

  test('the status label is the server\'s, and the code is kept beside it', () {
    final r = MaintenanceRequestModel.fromJson(row);

    // Shown: the label. Matched on for colour: the code. The app keeps no table of nine names.
    expect(r.statusText, 'In progress');
    expect(r.status, 'IN_PROGRESS');
  });

  test('a status with no label still shows something', () {
    final r = MaintenanceRequestModel.fromJson({...row, 'statusLabel': null});

    expect(r.statusText, 'IN_PROGRESS');
  });

  test('the unit prefers the number somebody knocks on', () {
    expect(MaintenanceRequestModel.fromJson(row).unitLabel, 'K04');
    expect(
      MaintenanceRequestModel.fromJson({...row, 'houseNumber': null}).unitLabel,
      'B4',
    );
    expect(
      MaintenanceRequestModel.fromJson(
        {...row, 'houseNumber': null, 'houseCode': null},
      ).unitLabel,
      '',
    );
  });

  test('open is the server\'s answer, not a guess from the status', () {
    // So a status added on the server does not silently read as closed here.
    final closedLooking =
        MaintenanceRequestModel.fromJson({...row, 'status': 'SOMETHING_NEW'});

    expect(closedLooking.open, isTrue, reason: 'the flag said so');
  });

  group('awaiting a rating', () {
    test('a resolved job nobody has rated asks to be rated', () {
      final r = MaintenanceRequestModel.fromJson(
        {...row, 'status': 'RESOLVED', 'open': false, 'tenantRating': null},
      );

      expect(r.awaitingRating, isTrue);
    });

    test('a rated one does not ask again', () {
      final r = MaintenanceRequestModel.fromJson(
        {...row, 'status': 'CLOSED', 'open': false, 'tenantRating': 4},
      );

      expect(r.awaitingRating, isFalse);
      expect(r.tenantRating, 4);
    });

    test('a job still in progress is not asking anybody anything', () {
      expect(MaintenanceRequestModel.fromJson(row).awaitingRating, isFalse);
    });
  });

  group('the timeline', () {
    const detail = <String, dynamic>{
      'request': row,
      'timeline': [
        {
          'id': 'u1',
          'updateType': 'STATUS',
          'fromStatus': 'SUBMITTED',
          'toStatus': 'ACKNOWLEDGED',
          'fromLabel': 'Submitted',
          'toLabel': 'Acknowledged',
          'comment': null,
          'visibleToTenant': true,
          'performedByName': 'Jane Mwangi',
          'performedOn': '2026-09-01T08:00:00Z',
        },
        {
          'id': 'u2',
          'updateType': 'COMMENT',
          'comment': 'Parts ordered.',
          'visibleToTenant': false,
          'performedByName': 'Peter Otieno',
          'performedOn': '2026-09-02T09:30:00Z',
        },
      ],
    };

    test('it nests the same row the list is built from', () {
      final d = MaintenanceDetailModel.fromJson(detail);

      expect(d.request.requestRef, 'MR-000412');
      expect(d.timeline, hasLength(2));
    });

    test('a move between states is told from a comment', () {
      final d = MaintenanceDetailModel.fromJson(detail);

      expect(d.timeline.first.isStatusChange, isTrue);
      expect(d.timeline.first.toLabel, 'Acknowledged');
      expect(d.timeline.last.isStatusChange, isFalse);
      expect(d.timeline.last.comment, 'Parts ordered.');
    });

    test('an internal note is flagged, not hidden', () {
      // The server already withholds what a tenant may not see. Anything that arrives here is
      // visible to whoever is reading it; the flag only says which were meant for the office.
      final d = MaintenanceDetailModel.fromJson(detail);

      expect(d.timeline.last.visibleToTenant, isFalse);
      expect(d.timeline.first.visibleToTenant, isTrue);
    });
  });

  test('the workload counts read as nought rather than missing', () {
    final empty = MaintenanceWorkloadModel.fromJson(const {});

    // A header saying "— open" where the server reported nothing is worse than "0 open".
    expect(empty.open, 0);
    expect(empty.late, 0);
    expect(
      MaintenanceWorkloadModel.fromJson(
        const {'open': 7, 'unassigned': 2, 'late': 1, 'awaitingClosure': 3},
      ).open,
      7,
    );
  });
}
