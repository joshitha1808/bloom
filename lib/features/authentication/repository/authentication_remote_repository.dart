import 'package:bloom/core/error/failure.dart';
import 'package:bloom/features/authentication/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:bloom/core/network/connection_check.dart';
import 'package:bloom/init_dependencies.dart';

part 'authentication_remote_repository.g.dart';

@riverpod
AuthenticationRemoteRepository authenticationRemoteRepository(Ref ref) {
  final firebaseAuth = serviceLocator<FirebaseAuth>();
  final connectionChecker = serviceLocator<ConnectionChecker>();
  return AuthenticationRemoteRepository(
    firebaseAuth: firebaseAuth,
    connectionChecker: connectionChecker,
  );
}

class AuthenticationRemoteRepository {
  final FirebaseAuth firebaseAuth;
  final ConnectionChecker connectionChecker;

  AuthenticationRemoteRepository({
    required this.firebaseAuth,
    required this.connectionChecker,
  });

  Future<Either<Failure, UserModel>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final isConnected = await connectionChecker.isConnected;
      if (!isConnected) {
        return Left(Failure('No internet connection.'));
      }
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final firebaseUser = credential.user;
      if (firebaseUser == null) {
        return left(Failure('Login failed. No user found.'));
      }
      final user = UserModel(
        uid: firebaseUser.uid,
        name: firebaseUser.displayName ?? '',
        email: firebaseUser.email ?? '',
        photoUrl: firebaseUser.photoURL,
        streakDays: 0,
        notificationsEnabled: true,
        isOnboarded: false,
        createdAt: DateTime.now(),
      );
      return right(user);
    } on FirebaseAuthException catch (e) {
      return left(Failure(e.message ?? 'Failed to sign up'));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, UserModel>> SignIn({
    required String email,
    required String password,
  }) async {
    try {
      final isConnected = await connectionChecker.isConnected;
      if (!isConnected) {
        return Left(Failure('No internet connection.'));
      }
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final firebaseUser = credential.user;
      if (firebaseUser == null) {
        return left(Failure('Login failed. No user found.'));
      }
      final user = UserModel(
        uid: firebaseUser.uid,
        name: firebaseUser.displayName ?? '',
        email: firebaseUser.email ?? '',
        photoUrl: firebaseUser.photoURL,
        streakDays: 0,
        notificationsEnabled: true,
        isOnboarded: false,
        createdAt: DateTime.now(),
      );
      return right(user);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(e.message ?? 'Login failed'));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
