import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:bloom_app/views/widgets/comment_widget.dart';
import 'package:bloom_app/views_models/comments/comments_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommentsView extends StatelessWidget with BLooMBackroundMixin {
  const CommentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
        decoration: bLooMGradient(),
        child: GetBuilder(
            init: CommentsViewModel(),
            builder: (controller) {
              return Scaffold(
                appBar: const AppBarComponent(
                  title: 'Comment',
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...List.generate(
                        commentReply.length,
                        (index) => CommentTileWidget(
                          isReply: commentReply[index],
                        ),
                      ),
                      postComment(controller.replyController, context)
                    ],
                  ).paddingSymmetric(horizontal: 16.w),
                ),
              );
            }),
      ),
    );
  }
}

List<bool> commentReply = [
  false,
  false,
  true,
  false,
];
Widget postComment(
    TextEditingController replyController, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CircleAvatar(
        radius: 22.r,
        child: const Icon(Icons.person),
      ),
      HorizontalSpacing(7.w),
      Flexible(
          child: TextFormField(
        controller: replyController,
        decoration: InputDecoration(
            border: const UnderlineInputBorder(
                borderSide: BorderSide(
              color: AppColors.magentaPink,
            )),
            suffixIcon: const Icon(
              Icons.send,
              color: AppColors.white,
            ),
            hintStyle: Fonts.noto(
                context, AppColors.grayniteGray, 13, FontWeight.w400),
            hintText: 'Write a comment...'),
      ).paddingOnly(bottom: 20.h))
    ],
  );
}
