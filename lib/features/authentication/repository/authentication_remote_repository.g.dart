// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_remote_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authenticationRemoteRepository)
final authenticationRemoteRepositoryProvider =
    AuthenticationRemoteRepositoryProvider._();

final class AuthenticationRemoteRepositoryProvider
    extends
        $FunctionalProvider<
          AuthenticationRemoteRepository,
          AuthenticationRemoteRepository,
          AuthenticationRemoteRepository
        >
    with $Provider<AuthenticationRemoteRepository> {
  AuthenticationRemoteRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authenticationRemoteRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authenticationRemoteRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthenticationRemoteRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AuthenticationRemoteRepository create(Ref ref) {
    return authenticationRemoteRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthenticationRemoteRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthenticationRemoteRepository>(
        value,
      ),
    );
  }
}

String _$authenticationRemoteRepositoryHash() =>
    r'12fb028ece06a4987ca3a2b3223c2bed5c623202';
