import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:house_organizer/core/constants/app_constants.dart';
import 'package:house_organizer/core/services/firebase_service.dart';

abstract class HouseMembershipDataSource {
  Future<String?> getHouseIdByJoinCode(String joinCode);
  Future<void> createHouseDocument(String id, Map<String, dynamic> data);
  String generateNewDocId();
  DateTime now();
}

class FirebaseHouseMembershipDataSource implements HouseMembershipDataSource {
  final FirebaseService _firebaseService;

  FirebaseHouseMembershipDataSource({FirebaseService? firebaseService})
      : _firebaseService = firebaseService ?? FirebaseService.instance;

  @override
  Future<String?> getHouseIdByJoinCode(String joinCode) async {
    final QuerySnapshot snapshot = await _firebaseService.getCollection(
      AppConstants.housesCollection,
      queryBuilder: (q) => q.where('joinCode', isEqualTo: joinCode),
      limit: 1,
    );
    if (snapshot.docs.isEmpty) return null;
    return snapshot.docs.first.id;
  }

  @override
  Future<void> createHouseDocument(String id, Map<String, dynamic> data) async {
    await _firebaseService.setDocument(
      AppConstants.housesCollection,
      id,
      data,
    );
  }

  @override
  String generateNewDocId() {
    return _firebaseService.firestore
        .collection(AppConstants.housesCollection)
        .doc()
        .id;
  }

  @override
  DateTime now() => DateTime.now();
}

class HouseMembershipService {
  HouseMembershipService({HouseMembershipDataSource? dataSource})
      : _dataSource = dataSource ?? FirebaseHouseMembershipDataSource();

  final HouseMembershipDataSource _dataSource;

  Future<String> resolveHouseIdByJoinCode(String rawCode) async {
    final code = rawCode.trim().toUpperCase();
    final id = await _dataSource.getHouseIdByJoinCode(code);
    if (id == null) {
      throw Exception('Invalid join code');
    }
    return id;
  }

  Future<String> createHouseAndReturnId({
    required String name,
    required String address,
    String? description,
    String? phoneNumber,
    String? email,
    String createdBy = '',
  }) async {
    final String id = _dataSource.generateNewDocId();
    final DateTime now = _dataSource.now();
    final String joinCode = _generateJoinCode();

    final Map<String, dynamic> data = <String, dynamic>{
      'id': id,
      'name': name.trim(),
      'address': address.trim(),
      'joinCode': joinCode,
      'createdBy': createdBy,
      'createdAt': now.toIso8601String(),
      'updatedAt': now.toIso8601String(),
      'residentIds': <String>[],
      'supervisorIds': <String>[],
      'isActive': true,
      'description': _emptyToNull(description),
      'phoneNumber': _emptyToNull(phoneNumber),
      'email': _emptyToNull(email),
    };

    await _dataSource.createHouseDocument(id, data);
    return id;
  }

  String _generateJoinCode() {
    const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final Random rng = Random.secure();
    final StringBuffer b = StringBuffer();
    for (int i = 0; i < 6; i++) {
      b.write(chars[rng.nextInt(chars.length)]);
    }
    return b.toString();
  }

  String? _emptyToNull(String? value) {
    if (value == null) return null;
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }
}

