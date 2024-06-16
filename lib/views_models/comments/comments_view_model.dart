import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentsViewModel extends GetxController {
  final replyController = TextEditingController();
  final replyFocus = FocusNode();
}
