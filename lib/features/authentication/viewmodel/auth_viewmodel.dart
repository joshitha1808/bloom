import 'package:bloom/features/authentication/model/user_model.dart';
import 'package:bloom/features/authentication/repository/authentication_remote_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_viewmodel.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  late final AuthenticationRemoteRepository _authRepository;

  @override
  AsyncValue<UserModel?> build() {
    _authRepository = ref.watch(authenticationRemoteRepositoryProvider);

    return const AsyncData(null);
  }

  Future<void> signInUser({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    final result = await _authRepository.signIn(
      email: email,
      password: password,
    );

    result.fold(
      (failure) {
        state = AsyncError(failure.message, StackTrace.current);
      },
      (user) {
        state = AsyncData(user);
      },
    );
  }

  Future<void> signUpUser({
    required String userName,
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    final result = await _authRepository.signUp(
      email: email,
      password: password,
    );

    result.fold(
      (failure) {
        state = AsyncError(failure.message, StackTrace.current);
      },
      (user) {
        state = AsyncData(user);
      },
    );
  }
}
