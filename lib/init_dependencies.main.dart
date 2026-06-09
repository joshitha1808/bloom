part of 'init_dependencies.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  serviceLocator.registerSingleton(FirebaseAuth.instance);
  serviceLocator.registerSingleton<http.Client>(Client());
  serviceLocator.registerLazySingleton<ConnectionChecker>(
    () => ConnectionCheckerImpl(),
  );
}
