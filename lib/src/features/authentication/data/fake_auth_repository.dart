import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/app_user.dart';

abstract class AuthRepository {
  Stream<AppUser?> authStateChanges();
  AppUser? get currentUser;
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> createUSerWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}

class FirebaseAuthRepository implements AuthRepository {
  @override
  Stream<AppUser?> authStateChanges() {
    // TODO: implement authStateChange
    throw UnimplementedError();
  }

  @override
  Future<void> createUSerWithEmailAndPassword(String email, String password) {
    // TODO: implement createUSerWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  // TODO: implement currentUser
  AppUser? get currentUser => throw UnimplementedError();

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}

class FakeAuthRepository implements AuthRepository {
  @override
  Stream<AppUser?> authStateChanges() => Stream.value(null);

  @override
  AppUser? get currentUser => null;

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    // TODO: Implement
  }

  @override
  Future<void> createUSerWithEmailAndPassword(
      String email, String password) async {
    //TODO : Implement
  }

  @override
  Future<void> signOut() async {
    //TODO: Implement
  }

  @override
  Stream<AppUser?> authStateChange() {
    // TODO: implement authStateChange
    throw UnimplementedError();
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final isFake = String.fromEnvironment('useFakeRepos') == 'true';
  // to use this , run the app with : --dart-define=useFakeRepos=true
  return isFake ? FakeAuthRepository() : FirebaseAuthRepository();
});

final authStateChangesProvider = StreamProvider.autoDispose<AppUser?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});
