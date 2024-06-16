import 'package:get/get.dart';

class NotificationSettingViewModel extends GetxController {
  List<bool> notificationState = [
    true,
    true,
    true,
    true,
    true,
  ];

  void setStateNotification(bool value, int index) {
    if (index == 0) {
      for (int i = 0; i < notificationState.length; i++) {
        notificationState[i] = value;
      }
    }
    notificationState[index] = value;
    update();
  }
}
