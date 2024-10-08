//Modified on 12-06-2024 9:40PM
import 'dart:async'; // Make sure to import this for StreamSubscription
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:unimart/utils/popups/loaders.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  ///Initialize the network manager and set up a stream to continually check the connection status
  @override 
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  ///Update the connection status based on changes in Connectivity and show a relevant popup for no internet connection
  Future<void> _updateConnectionStatus(List<ConnectivityResult> results) async {
    if (results.isNotEmpty) {
      _connectionStatus.value = results.first;
      if (_connectionStatus.value == ConnectivityResult.none) {
        TLoaders.customToast(message:'No Internet connection');
      }
    }
  }

  ///Check the internet connection status.
  ///Return 'true' if connected,'false' otherwise
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if(result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  ///Dispose or close the active connectivity stream.
  @override 
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
