import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:house_organizer/core/constants/app_constants.dart';
import 'package:house_organizer/core/services/firebase_service.dart';
import 'package:house_organizer/data/models/house.dart';
import 'package:house_organizer/data/models/list_model.dart';
import 'package:house_organizer/data/models/task.dart';
import 'package:house_organizer/features/supervisor/models/supervisor_stats.dart';

class SupervisorRepository {
  SupervisorRepository({FirebaseService? firebase})
      : _firebase = firebase ?? FirebaseService.instance;
  final FirebaseService _firebase;

  Future<List<House>> getHousesForSupervisor(String supervisorUserId) async {
    final qs = await _firebase.getCollection(
      AppConstants.housesCollection,
      queryBuilder: (q) => q.where('supervisorIds', arrayContains: supervisorUserId),
    );
    return qs.docs
        .map((d) => House.fromJson(d.data() as Map<String, dynamic>))
        .toList();
  }

  Future<List<ListModel>> getListsForHouses(List<String> houseIds) async {
    final results = <ListModel>[];
    for (final chunk in _chunk(houseIds, 10)) {
      final qs = await _firebase.getCollection(
        AppConstants.listsCollection,
        queryBuilder: (q) => q.where('houseId', whereIn: chunk),
      );
      results.addAll(qs.docs
          .map((d) => ListModel.fromJson(d.data() as Map<String, dynamic>)));
    }
    return results;
  }

  Future<List<Task>> getTasksForHouses(List<String> houseIds) async {
    final tasks = <Task>[];
    for (final chunk in _chunk(houseIds, 10)) {
      final qs = await _firebase.getCollection(
        AppConstants.tasksCollection,
        queryBuilder: (q) => q.where('houseId', whereIn: chunk),
      );
      tasks.addAll(
        qs.docs.map((d) => Task.fromJson(d.data() as Map<String, dynamic>)),
      );
    }
    return tasks;
  }

  Future<SupervisorStats> getSupervisorStats(String supervisorUserId) async {
    final houses = await getHousesForSupervisor(supervisorUserId);
    final houseIds = houses.map((h) => h.id).toList();

    if (houseIds.isEmpty) {
      return const SupervisorStats(
        houseCount: 0,
        residentCount: 0,
        listCount: 0,
        tasksPending: 0,
        tasksInProgress: 0,
        tasksCompleted: 0,
        tasksOverdue: 0,
      );
    }

    final lists = await getListsForHouses(houseIds);
    final tasks = await getTasksForHouses(houseIds);

    final now = DateTime.now();
    int pending = 0, inProgress = 0, completed = 0, overdue = 0;
    for (final t in tasks) {
      switch (t.status) {
        case TaskStatus.pending:
          pending++;
          break;
        case TaskStatus.inProgress:
          inProgress++;
          break;
        case TaskStatus.completed:
          completed++;
          break;
        case TaskStatus.cancelled:
          break;
      }
      if ((t.status == TaskStatus.pending || t.status == TaskStatus.inProgress) &&
          t.dueDate != null &&
          t.dueDate!.isBefore(now)) {
        overdue++;
      }
    }

    final residentCount =
        houses.fold<int>(0, (acc, h) => acc + (h.residentIds?.length ?? 0));

    return SupervisorStats(
      houseCount: houses.length,
      residentCount: residentCount,
      listCount: lists.length,
      tasksPending: pending,
      tasksInProgress: inProgress,
      tasksCompleted: completed,
      tasksOverdue: overdue,
    );
  }

  Stream<QuerySnapshot> streamTasksForHouse(String houseId) {
    return _firebase.listenToCollection(
      AppConstants.tasksCollection,
      queryBuilder: (q) => q.where('houseId', isEqualTo: houseId),
    );
  }

  Iterable<List<T>> _chunk<T>(List<T> list, int size) sync* {
    for (var i = 0; i < list.length; i += size) {
      yield list.sublist(i, i + size > list.length ? list.length : i + size);
    }
  }
}
