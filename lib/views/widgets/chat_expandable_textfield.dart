import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/constants/svgs/app_vectors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ChatExpandaleTextField extends StatelessWidget {
  const ChatExpandaleTextField(
      {super.key,
      required this.textEditingController,
      required this.focusNode,
      required this.onSend,
      required this.onEmojiTap});
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final void Function() onSend;
  final void Function() onEmojiTap;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      focusNode: focusNode,
      autocorrect: true,
      cursorColor: AppColors.magentaPink,
      maxLines: 5,
      minLines: 1,
      scrollPhysics: const BouncingScrollPhysics(),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        fillColor: AppColors.white,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide(
              color: const Color(0xffdfdfdf).withOpacity(0.86), width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide(
              color: const Color(0xffdfdfdf).withOpacity(0.86), width: 0.5),
        ),
        constraints: const BoxConstraints(maxHeight: 100, minHeight: 50),
        prefixIcon: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              alignment: Alignment.bottomCenter,
              color: AppColors.magentaPink,
              onPressed: onEmojiTap,
              icon: const Icon(
                CupertinoIcons.smiley,
              ),
            ),
          ],
        ),
        suffixIcon: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              alignment: Alignment.bottomCenter,
              color: AppColors.magentaPink,
              onPressed: onSend,
              icon: CircleAvatar(
                backgroundColor: AppColors.magentaPink,
                child: SvgPicture.asset(
                  AppVectors.sendIcon,
                ),
              ),
            ),
          ],
        ),
      ),
      // expands: true,
    ).marginOnly(bottom: 10.h, left: 16.w, right: 16.w);
  }
}
