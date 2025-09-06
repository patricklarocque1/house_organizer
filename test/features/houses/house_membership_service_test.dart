import 'package:flutter_test/flutter_test.dart';
import 'package:house_organizer/features/houses/services/house_membership_service.dart';

class _FakeDataSource implements HouseMembershipDataSource {
  final Map<String, String> joinCodeToId = {};
  final Map<String, Map<String, dynamic>> created = {};
  String nextId = 'h1';
  DateTime fixedNow = DateTime(2025, 1, 1);

  @override
  Future<String?> getHouseIdByJoinCode(String joinCode) async {
    return joinCodeToId[joinCode];
  }

  @override
  Future<void> createHouseDocument(String id, Map<String, dynamic> data) async {
    created[id] = data;
  }

  @override
  String generateNewDocId() => nextId;

  @override
  DateTime now() => fixedNow;
}

void main() {
  group('HouseMembershipService', () {
    test('resolveHouseIdByJoinCode returns id for valid code', () async {
      final fake = _FakeDataSource();
      fake.joinCodeToId['ABC123'] = 'house_abc';
      final service = HouseMembershipService(dataSource: fake);

      final id = await service.resolveHouseIdByJoinCode('abc123');
      expect(id, 'house_abc');
    });

    test('resolveHouseIdByJoinCode throws for invalid code', () async {
      final fake = _FakeDataSource();
      final service = HouseMembershipService(dataSource: fake);

      expect(
        () => service.resolveHouseIdByJoinCode('doesnotexist'),
        throwsA(isA<Exception>()),
      );
    });

    test('createHouseAndReturnId writes doc and returns id', () async {
      final fake = _FakeDataSource();
      fake.nextId = 'hid_42';
      final service = HouseMembershipService(dataSource: fake);

      final id = await service.createHouseAndReturnId(
        name: 'Elm House',
        address: '1 Elm St',
        description: 'desc',
        phoneNumber: '555-0000',
        email: 'h@e.com',
      );

      expect(id, 'hid_42');
      expect(fake.created.containsKey('hid_42'), isTrue);
      final data = fake.created['hid_42']!;
      expect(data['name'], 'Elm House');
      expect(data['address'], '1 Elm St');
      expect(data['joinCode'], isA<String>());
      expect((data['joinCode'] as String).length, 6);
      expect(data['isActive'], true);
      expect(data['createdAt'], isNotEmpty);
      expect(data['updatedAt'], isNotEmpty);
    });
  });
}