import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/constants/images/app_images.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/views/widgets/chat_appbar.dart';
import 'package:bloom_app/views/widgets/chat_bubble.dart';
import 'package:bloom_app/views/widgets/chat_expandable_textfield.dart';
import 'package:bloom_app/views_models/chat/chat_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});
  // final ChatViewmodel viewmodel = Get.put(ChatViewmodel());
  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.sizeOf(context).width;
    // var height = MediaQuery.sizeOf(context).height;

    return GetBuilder(
        init: ChatViewmodel(),
        builder: (viewmodel) {
          return Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(
                    AppImages.chatBg,
                  ),
                  fit: BoxFit.cover,
                )),
            child: Scaffold(
              backgroundColor: Colors.black.withOpacity(0.04),
              appBar: const ChatAppBarWidget(
                name: "Brittany Marleyg",
                profile: AppImages.purpleFlower,
              ),
              //
              body: GroupedListView<dynamic, dynamic>(
                controller: viewmodel.scrollController,
                // physics: const BouncingScrollPhysics(),
                elements: viewmodel.elements,
                groupBy: (message) {
                  // var dates = DateTime.parse(message['group']);

                  return DateTime(
                    DateTime.parse(message['group']).year,
                    DateTime.parse(message['group']).month,
                    DateTime.parse(message['group']).day,
                  );
                },

                groupHeaderBuilder: (element) => SizedBox(
                  height: 95.h,
                  width: 180.w,
                  child: Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                      color: AppColors.sonicSilver.withOpacity(0.16),
                      child: Text(
                        // DateTime.parse(element['group']).toString(), //'Today'
                        (DateTime.parse(element['group']).year ==
                                        DateTime.now().year &&
                                    DateTime.parse(element['group']).month ==
                                        DateTime.now().month &&
                                    DateTime.parse(element['group']).day ==
                                        DateTime.now().day) ==
                                true
                            ? 'Today'
                            : DateFormat.yMMMMd()
                                .format(DateTime.parse(element['group']))
                                .toString(),
                        textAlign: TextAlign.center,
                        style: Fonts.noto(
                          context,
                          AppColors.black.withOpacity(0.60),
                          10.sp,
                          FontWeight.w600,
                        ),
                      ).paddingSymmetric(horizontal: 10.w, vertical: 5.h),
                    ),
                  ),
                ),
                sort: true,
                groupComparator: (value1, value2) {
                  // Compare the DateTime objects
                  return value1.compareTo(value2);
                },
                itemBuilder: (context, dynamic element) => ChatBubble(
                  text: element['msg'],
                  bottomText: "9:47 PM",
                  isSender: element['sender'],
                  color: element['sender']
                      ? AppColors.magentaPink
                      : AppColors.white,
                  textStyle: Fonts.noto(
                      context,
                      element['sender'] ? AppColors.white : AppColors.black,
                      10,
                      FontWeight.bold),
                  tail: true,
                ),
                useStickyGroupSeparators: true,
                floatingHeader: true,
                // reverse: true,
                order: GroupedListOrder.ASC,
              ).paddingOnly(bottom: 100),

              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: ChatExpandaleTextField(
                textEditingController: viewmodel.textController,
                focusNode: viewmodel.focusNode,
                // onEmojiTap: () {},
                onSend: () {
                  if (viewmodel.textController.text.isNotEmpty) {
                    viewmodel.onSend();
                  }
                },
                onEmojiTap: () {},
              ),
              resizeToAvoidBottomInset: true,
              extendBody: true,
            ),
          );
        });
  }
}
