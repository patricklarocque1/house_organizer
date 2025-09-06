import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:house_organizer/features/auth/repositories/auth_repository.dart';
import 'package:house_organizer/data/models/user.dart';
import 'package:house_organizer/data/models/house.dart';

// Auth repository provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

// Auth state provider
final authStateProvider = StreamProvider<firebase_auth.User?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges;
});

// Current user data provider
final currentUserProvider = FutureProvider<User?>((ref) async {
  final authRepository = ref.watch(authRepositoryProvider);
  return await authRepository.getCurrentUserData();
});

// Auth state notifier
class AuthNotifier extends StateNotifier<AsyncValue<User?>> {
  final AuthRepository _authRepository;
  StreamSubscription<firebase_auth.User?>? _authSubscription;

  AuthNotifier(this._authRepository) : super(const AsyncValue.loading()) {
    _init();
  }

  void _init() {
    _authSubscription = _authRepository.authStateChanges.listen((user) async {
      if (user != null) {
        try {
          final userData = await _authRepository.getCurrentUserData();
          state = AsyncValue.data(userData);
        } catch (e) {
          state = AsyncValue.error(e, StackTrace.current);
        }
      } else {
        state = const AsyncValue.data(null);
      }
    });
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    super.dispose();
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    try {
      final user = await _authRepository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      state = AsyncValue.data(user);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String displayName,
    required String houseId,
    required UserRole role,
  }) async {
    state = const AsyncValue.loading();
    try {
      final user = await _authRepository.createUserWithEmailAndPassword(
        email: email,
        password: password,
        displayName: displayName,
        houseId: houseId,
        role: role,
      );
      state = AsyncValue.data(user);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> signOut() async {
    try {
      await _authRepository.signOut();
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _authRepository.sendPasswordResetEmail(email);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> joinHouse(String joinCode) async {
    final currentUser = state.value;
    if (currentUser == null) return;

    try {
      await _authRepository.joinHouse(joinCode, currentUser.id);
      // Refresh user data
      final updatedUser = await _authRepository.getCurrentUserData();
      state = AsyncValue.data(updatedUser);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> createHouse({
    required String name,
    required String address,
    String? description,
    String? phoneNumber,
    String? email,
  }) async {
    final currentUser = state.value;
    if (currentUser == null) return;

    try {
      await _authRepository.createHouse(
        name: name,
        address: address,
        createdBy: currentUser.id,
        description: description,
        phoneNumber: phoneNumber,
        email: email,
      );
      // Refresh user data
      final updatedUser = await _authRepository.getCurrentUserData();
      state = AsyncValue.data(updatedUser);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

// Auth notifier provider
final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<User?>>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthNotifier(authRepository);
});

// House providers
final houseProvider = FutureProvider.family<House?, String>((
  ref,
  houseId,
) async {
  // This would need to be implemented in the repository
  // For now, return null
  return null;
});
