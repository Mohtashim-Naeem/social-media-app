import 'package:bloom_app/views/components/nointernet_component.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkConnectivityController extends GetxController {
  bool isInternetConnected = false;

  @override
  void onReady() {
    super.onReady();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.ethernet) {
        if (isInternetConnected) {
          Get.back();
          isInternetConnected = false;
        }
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        if (!isInternetConnected) {
          isInternetConnected = true;
          Get.bottomSheet(const NoInternetSheet(),
              isDismissible: false, enableDrag: false);
        } else {
          if (isInternetConnected) {
            isInternetConnected = false;
            Get.back();
          }
        }
      }
    });
  }
}
