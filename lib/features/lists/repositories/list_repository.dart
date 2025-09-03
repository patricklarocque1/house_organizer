import 'package:house_organizer/core/services/firebase_service.dart';
import 'package:house_organizer/core/services/hive_service.dart';
import 'package:house_organizer/data/models/list_model.dart';
import 'package:house_organizer/data/models/audit_log.dart';
import 'package:uuid/uuid.dart';

class ListRepository {
  final FirebaseService _firebaseService = FirebaseService.instance;
  final HiveService _hiveService = HiveService.instance;
  final Uuid _uuid = const Uuid();

  // Create a new list
  Future<ListModel> createList({
    required String name,
    required String houseId,
    required String createdBy,
    required ListType type,
    String? description,
    String? assignedTo,
    bool isShared = true,
    DateTime? dueDate,
  }) async {
    try {
      final listId = _uuid.v4();
      final now = DateTime.now();

      final list = ListModel(
        id: listId,
        name: name,
        houseId: houseId,
        createdBy: createdBy,
        type: type,
        description: description,
        items: [],
        assignedTo: assignedTo,
        isCompleted: false,
        createdAt: now,
        updatedAt: now,
      );

      // Save to Firestore
      await _firebaseService.setDocument(
        'lists',
        listId,
        list.toJson(),
      );

      // Save to local storage
      await _hiveService.saveList(list);

      // Create audit log
      await _createAuditLog(
        houseId: houseId,
        userId: createdBy,
        action: 'CREATE_LIST',
        targetId: listId,
        details: {'listName': name, 'listType': type.name},
      );

      return list;
    } catch (e) {
      throw Exception('Failed to create list: $e');
    }
  }

  // Get lists for a house
  Stream<List<ListModel>> getListsForHouse(String houseId) {
    return _firebaseService
        .listenToCollection(
          'lists',
          queryBuilder: (query) => query
              .where('houseId', isEqualTo: houseId)
              .orderBy('createdAt', descending: true),
        )
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => ListModel.fromJson(doc.data() as Map<String, dynamic>))
              .toList(),
        );
  }

  // Get lists by type
  Stream<List<ListModel>> getListsByType(String houseId, ListType type) {
    return _firebaseService
        .listenToCollection(
          'lists',
          queryBuilder: (query) => query
              .where('houseId', isEqualTo: houseId)
              .where('type', isEqualTo: type.name)
              .orderBy('createdAt', descending: true),
        )
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => ListModel.fromJson(doc.data() as Map<String, dynamic>))
              .toList(),
        );
  }

  // Get a specific list
  Future<ListModel?> getList(String listId) async {
    try {
      final doc = await _firebaseService.getDocument('lists', listId);
      if (doc.exists) {
        return ListModel.fromJson(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to get list: $e');
    }
  }

  // Update a list
  Future<ListModel> updateList(ListModel list) async {
    try {
      final updatedList = list.copyWith(updatedAt: DateTime.now());

      // Update in Firestore
      await _firebaseService.setDocument(
        'lists',
        list.id,
        updatedList.toJson(),
      );

      // Update in local storage
      await _hiveService.saveList(updatedList);

      // Create audit log
      await _createAuditLog(
        houseId: list.houseId,
        userId: list.createdBy,
        action: 'UPDATE_LIST',
        targetId: list.id,
        details: {'listName': list.name},
      );

      return updatedList;
    } catch (e) {
      throw Exception('Failed to update list: $e');
    }
  }

  // Delete a list
  Future<void> deleteList(String listId, String houseId, String userId) async {
    try {
      // Delete from Firestore
      await _firebaseService.deleteDocument('lists', listId);

      // Delete from local storage
      await _hiveService.deleteList(listId);

      // Create audit log
      await _createAuditLog(
        houseId: houseId,
        userId: userId,
        action: 'DELETE_LIST',
        targetId: listId,
        details: {},
      );
    } catch (e) {
      throw Exception('Failed to delete list: $e');
    }
  }

  // Add item to list
  Future<ListModel> addItemToList(
    String listId,
    ListItem item,
    String houseId,
    String userId,
  ) async {
    try {
      final list = await getList(listId);
      if (list == null) {
        throw Exception('List not found');
      }

      final updatedItems = [...list.items, item];
      final updatedList = list.copyWith(
        items: updatedItems,
        updatedAt: DateTime.now(),
      );

      await updateList(updatedList);

      // Create audit log
      await _createAuditLog(
        houseId: houseId,
        userId: userId,
        action: 'ADD_LIST_ITEM',
        targetId: listId,
        details: {'itemName': item.name},
      );

      return updatedList;
    } catch (e) {
      throw Exception('Failed to add item to list: $e');
    }
  }

  // Update item in list
  Future<ListModel> updateListItem(
    String listId,
    ListItem updatedItem,
    String houseId,
    String userId,
  ) async {
    try {
      final list = await getList(listId);
      if (list == null) {
        throw Exception('List not found');
      }

      final updatedItems = list.items.map((item) {
        return item.id == updatedItem.id ? updatedItem : item;
      }).toList();

      final updatedList = list.copyWith(
        items: updatedItems,
        updatedAt: DateTime.now(),
      );

      await updateList(updatedList);

      // Create audit log
      await _createAuditLog(
        houseId: houseId,
        userId: userId,
        action: 'UPDATE_LIST_ITEM',
        targetId: listId,
        details: {'itemName': updatedItem.name},
      );

      return updatedList;
    } catch (e) {
      throw Exception('Failed to update list item: $e');
    }
  }

  // Remove item from list
  Future<ListModel> removeItemFromList(
    String listId,
    String itemId,
    String houseId,
    String userId,
  ) async {
    try {
      final list = await getList(listId);
      if (list == null) {
        throw Exception('List not found');
      }

      final updatedItems = list.items.where((item) => item.id != itemId).toList();
      final updatedList = list.copyWith(
        items: updatedItems,
        updatedAt: DateTime.now(),
      );

      await updateList(updatedList);

      // Create audit log
      await _createAuditLog(
        houseId: houseId,
        userId: userId,
        action: 'REMOVE_LIST_ITEM',
        targetId: listId,
        details: {'itemId': itemId},
      );

      return updatedList;
    } catch (e) {
      throw Exception('Failed to remove item from list: $e');
    }
  }

  // Mark list as completed
  Future<ListModel> completeList(
    String listId,
    String houseId,
    String userId,
  ) async {
    try {
      final list = await getList(listId);
      if (list == null) {
        throw Exception('List not found');
      }

      final updatedList = list.copyWith(
        isCompleted: true,
        completedAt: DateTime.now(),
        completedBy: userId,
        updatedAt: DateTime.now(),
      );

      await updateList(updatedList);

      // Create audit log
      await _createAuditLog(
        houseId: houseId,
        userId: userId,
        action: 'COMPLETE_LIST',
        targetId: listId,
        details: {'listName': list.name},
      );

      return updatedList;
    } catch (e) {
      throw Exception('Failed to complete list: $e');
    }
  }

  // Get list statistics
  Future<Map<String, int>> getListStatistics(String houseId) async {
    try {
      final snapshot = await _firebaseService.getCollection(
        'lists',
        queryBuilder: (query) => query.where('houseId', isEqualTo: houseId),
      );
      final lists = snapshot.docs
          .map((doc) => ListModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      return {
        'total': lists.length,
        'grocery': lists.where((l) => l.type == ListType.grocery).length,
        'errands': lists.where((l) => l.type == ListType.errands).length,
        'completed': lists.where((l) => l.isCompleted == true).length,
        'pending': lists.where((l) => l.isCompleted != true).length,
      };
    } catch (e) {
      throw Exception('Failed to get list statistics: $e');
    }
  }

  // Create audit log entry
  Future<void> _createAuditLog({
    required String houseId,
    required String userId,
    required String action,
    required String targetId,
    required Map<String, dynamic> details,
  }) async {
    try {
      final auditLog = AuditLog(
        id: _uuid.v4(),
        houseId: houseId,
        userId: userId,
        action: AuditAction.values.firstWhere(
          (a) => a.name == action,
          orElse: () => AuditAction.create,
        ),
        targetId: targetId,
        targetType: 'list',
        timestamp: DateTime.now(),
      );

      await _firebaseService.setDocument(
        'audit_logs',
        auditLog.id,
        auditLog.toJson(),
      );
    } catch (e) {
      // Don't throw here as audit logging is not critical
    }
  }
}
