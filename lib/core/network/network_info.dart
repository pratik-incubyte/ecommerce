import 'package:connectivity_plus/connectivity_plus.dart';

/// Abstract class for network connectivity information
abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<List<ConnectivityResult>> get connectivityStream;
}

/// Implementation of [NetworkInfo] using connectivity_plus package
class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;
  
  NetworkInfoImpl(this.connectivity);
  
  @override
  Future<bool> get isConnected async {
    final result = await connectivity.checkConnectivity();
    return !result.contains(ConnectivityResult.none);
  }
  
  @override
  Stream<List<ConnectivityResult>> get connectivityStream {
    return connectivity.onConnectivityChanged;
  }
}
