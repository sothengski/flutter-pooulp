import 'package:connectivity_plus/connectivity_plus.dart';

class NetWorkInfoImpl implements NetworkInfoRepository {
  ConnectivityResult? _connectivityResult;

  Future _connect() async {
    _connectivityResult = await Connectivity().checkConnectivity();
  }

  @override
  Future<bool> get isConnected async {
    await _connect();

    if (_connectivityResult == ConnectivityResult.mobile) {
      return true;
    }
    if (_connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}

abstract class NetworkInfoRepository {
  Future<bool> get isConnected;
}
