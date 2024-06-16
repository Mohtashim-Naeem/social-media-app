import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatViewmodel extends GetxController {
  final TextEditingController textController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  ScrollController scrollController = ScrollController();
  void autoLastMessageScroll() {
    scrollController.animateTo(scrollController.position.extentTotal,
        duration: const Duration(microseconds: 500), curve: Curves.linear);
  }

  List<Map<String, dynamic>> elements = [
    {
      'msg': 'Hey, what’s up Eva?',
      'group': DateTime.now().toString(), // Yesterday
      'sender': true,
      'name': 'you',
    },
    {
      'msg': 'Sounds good!',
      'group': DateTime.now().toString(), // Today
      'sender': false,
      'name': 'you',
    },
    // {
    //   'msg': 'Hey, what’s up Eva?',
    //   'group': DateTime.now(), // Today
    //   'sender': true,
    //   'name': 'you',
    // },
    // {
    //   'msg': 'Hey, I am doing great, where have you been?',
    //   'group': DateTime.now().subtract(const Duration(days: 1)), // Today
    //   'sender': false,
    //   'name': 'me',
    // },
    // {
    //   'msg': 'Hey, I am doing great, where have you been?',
    //   'group': DateTime.now().subtract(const Duration(days: 1)), // Today
    //   'sender': false,
    //   'name': 'me',
    // },
    {
      'msg': 'Hey, I am doing great, where have you been?',
      'group':
          DateTime.now().subtract(const Duration(days: 1)).toString(), // Today
      'sender': false,
      'name': 'me',
    },
    {
      'msg': " Let's get lunch. How about pizza?",
      'group':
          DateTime.now().subtract(const Duration(days: 1)).toString(), // Today
      'sender': true,
      'name': 'you',
    },
  ];
  bool isBlocked = false;

  void onSend() {
    elements.add(
      {
        'msg': textController.text,
        'group': DateTime.now().toString(), // Today
        'sender': true,
        'name': 'you',
      },
    );
    textController.clear();
    autoLastMessageScroll();
    update();
  }
}
