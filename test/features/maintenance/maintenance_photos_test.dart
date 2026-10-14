import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/maintenance/domain/maintenance_models.dart';

/// A repair's photos, as the phone reads them: the request's own, and each update's.
void main() {
  test('photos split between the request and its updates', () {
    final detail = MaintenanceDetailModel.fromJson({
      'request': {
        'id': 'r1', 'requestRef': 'MR-1', 'title': 'Leak', 'description': 'Under the sink',
        'status': 'SUBMITTED', 'statusLabel': 'Submitted', 'priority': 'NORMAL',
      },
      'timeline': const [],
      'photos': [
        {'id': 'p1', 'updateId': null, 'uploadedByName': 'Bon', 'createdOn': '2026-10-15T08:00:00Z'},
        {'id': 'p2', 'updateId': 'u1', 'uploadedByName': 'Caretaker', 'createdOn': '2026-10-15T10:00:00Z'},
      ],
    });

    expect(detail.photos.where((p) => p.updateId == null).map((p) => p.id), ['p1']);
    expect(detail.photos.where((p) => p.updateId == 'u1').map((p) => p.id), ['p2']);
  });

  test('a detail without photos reads as none', () {
    final detail = MaintenanceDetailModel.fromJson({
      'request': {
        'id': 'r1', 'requestRef': 'MR-1', 'title': 'Leak', 'description': 'Under the sink',
        'status': 'SUBMITTED', 'statusLabel': 'Submitted', 'priority': 'NORMAL',
      },
    });

    expect(detail.photos, isEmpty);
  });
}
