import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract interface class ConnectionChecker {
  Future<bool> get isConnected;
}

class ConnectionCheckerImpl implements ConnectionChecker {
  final InternetConnection _connectionChecker;

  ConnectionCheckerImpl() : _connectionChecker = InternetConnection();

  @override
  Future<bool> get isConnected => _connectionChecker.hasInternetAccess;
}
