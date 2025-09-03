import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_organizer/data/models/list_model.dart';
import 'package:house_organizer/features/auth/providers/auth_providers.dart';
import 'package:house_organizer/features/lists/repositories/list_repository.dart';

// List repository provider
final listRepositoryProvider = Provider<ListRepository>((ref) {
  return ListRepository();
});

// Lists for house provider
final listsForHouseProvider = StreamProvider.family<List<ListModel>, String>((
  ref,
  houseId,
) {
  final listRepository = ref.watch(listRepositoryProvider);
  return listRepository.getListsForHouse(houseId);
});

// Lists by type provider
final listsByTypeProvider =
    StreamProvider.family<List<ListModel>, ListTypeFilter>((ref, filter) {
      final listRepository = ref.watch(listRepositoryProvider);
      final authState = ref.watch(authNotifierProvider);

      return authState.when(
        data: (user) {
          if (user == null) return Stream.value([]);

          if (filter.type != null) {
            return listRepository.getListsByType(user.houseId, filter.type!);
          } else {
            return listRepository.getListsForHouse(user.houseId);
          }
        },
        loading: () => Stream.value([]),
        error: (_, __) => Stream.value([]),
      );
    });

// List statistics provider
final listStatisticsProvider = FutureProvider.family<Map<String, int>, String>((
  ref,
  houseId,
) {
  final listRepository = ref.watch(listRepositoryProvider);
  return listRepository.getListStatistics(houseId);
});

// List notifier for CRUD operations
class ListNotifier extends StateNotifier<AsyncValue<void>> {
  final ListRepository _listRepository;
  final Ref _ref;

  ListNotifier(this._listRepository, this._ref)
    : super(const AsyncValue.data(null));

  Future<void> createList({
    required String name,
    required ListType type,
    String? description,
    String? assignedTo,
    bool isShared = true,
    DateTime? dueDate,
  }) async {
    state = const AsyncValue.loading();

    try {
      final authState = _ref.read(authNotifierProvider);
      final user = authState.value;

      if (user == null) {
        throw Exception('User not authenticated');
      }

      await _listRepository.createList(
        name: name,
        houseId: user.houseId,
        createdBy: user.id,
        type: type,
        description: description,
        assignedTo: assignedTo,
        isShared: isShared,
        dueDate: dueDate,
      );

      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> updateList(ListModel list) async {
    state = const AsyncValue.loading();

    try {
      await _listRepository.updateList(list);
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> deleteList(String listId) async {
    state = const AsyncValue.loading();

    try {
      final authState = _ref.read(authNotifierProvider);
      final user = authState.value;

      if (user == null) {
        throw Exception('User not authenticated');
      }

      await _listRepository.deleteList(listId, user.houseId, user.id);
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> addItemToList(String listId, ListItem item) async {
    state = const AsyncValue.loading();

    try {
      final authState = _ref.read(authNotifierProvider);
      final user = authState.value;

      if (user == null) {
        throw Exception('User not authenticated');
      }

      await _listRepository.addItemToList(listId, item, user.houseId, user.id);
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> updateListItem(String listId, ListItem item) async {
    state = const AsyncValue.loading();

    try {
      final authState = _ref.read(authNotifierProvider);
      final user = authState.value;

      if (user == null) {
        throw Exception('User not authenticated');
      }

      await _listRepository.updateListItem(listId, item, user.houseId, user.id);
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> removeItemFromList(String listId, String itemId) async {
    state = const AsyncValue.loading();

    try {
      final authState = _ref.read(authNotifierProvider);
      final user = authState.value;

      if (user == null) {
        throw Exception('User not authenticated');
      }

      await _listRepository.removeItemFromList(
        listId,
        itemId,
        user.houseId,
        user.id,
      );
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> completeList(String listId) async {
    state = const AsyncValue.loading();

    try {
      final authState = _ref.read(authNotifierProvider);
      final user = authState.value;

      if (user == null) {
        throw Exception('User not authenticated');
      }

      await _listRepository.completeList(listId, user.houseId, user.id);
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

// List notifier provider
final listNotifierProvider =
    StateNotifierProvider<ListNotifier, AsyncValue<void>>((ref) {
      final listRepository = ref.watch(listRepositoryProvider);
      return ListNotifier(listRepository, ref);
    });

// List type filter class
class ListTypeFilter {
  final ListType? type;
  final bool? isCompleted;

  const ListTypeFilter({this.type, this.isCompleted});

  ListTypeFilter copyWith({ListType? type, bool? isCompleted}) {
    return ListTypeFilter(
      type: type ?? this.type,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
