import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  RxInt connectionStatus = 0.obs;
  RxString connectionMsg = ''.obs;
  RxBool internetStatus = false.obs;

  final Connectivity connectivity = Connectivity();

  @override
  void onInit() {
    initConnectivity();
    super.onInit();
  }

  // bool verify() {
  //   late bool internetStatus;
  //   try {
  //     final result = connectivity.checkConnectivity();

  //     if (result != null) {
  //       internetStatus = true;
  //     }
  //   } on SocketException catch (_) {
  //     internetStatus = false;
  //   }
  //   return internetStatus;
  // }

  Future<void> initConnectivity() async {
    late ConnectivityResult? result;

    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
    return updateConnectionStatus(result);
  }

  void updateConnectionStatus(ConnectivityResult? result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatus.value = 1;
        internetStatus.value = true;
        connectionMsg.value = 'Wifi Connection';
        break;
      case ConnectivityResult.mobile:
        connectionStatus.value = 2;
        internetStatus.value = true;
        connectionMsg.value = 'Mobile Data Connection';
        break;
      case ConnectivityResult.none:
        connectionStatus.value = 3;
        internetStatus.value = false;
        connectionMsg.value = 'No Internet Connection';
        break;
      default:
        internetStatus.value = false;
        Get.snackbar("Network Error", "Failed to get network connection");
        break;
    }
  }
}
