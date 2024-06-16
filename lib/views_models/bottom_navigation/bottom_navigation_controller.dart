import 'package:bloom_app/constants/svgs/app_vectors.dart';
import 'package:bloom_app/views/screens/bottom_navigation/chat/chat_view.dart';
import 'package:bloom_app/views/screens/bottom_navigation/home/home_view.dart';
import 'package:bloom_app/views/screens/bottom_navigation/notifications/notifications_view.dart';
import 'package:bloom_app/views/screens/bottom_navigation/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  BottomNavigationController({indecurrentNavigationIndexxPage});
  int currentNavigationIndex = 0;
  void setNavigationIndex(int i) {
    currentNavigationIndex = i;
    update();
  }

  List<String> icon = [
    AppVectors.homeIcon,
    AppVectors.chatIcon,
    AppVectors.notificationIcon,
    AppVectors.profileIcon,
  ];

  List<String> fillIcon = [
    AppVectors.homeFillIcon,
    AppVectors.chatIcon,
    AppVectors.notificationFillIcon,
    AppVectors.profileFillIcon,
  ];

  List<String> label = [
    'Home',
    'Admin Chat',
    'Notifications',
    'Profile',
  ];

  List<Widget> destination = [
    const HomeView(),
    const ChatView(),
    const NotificationView(),
    ProfileView(),
  ];
}
