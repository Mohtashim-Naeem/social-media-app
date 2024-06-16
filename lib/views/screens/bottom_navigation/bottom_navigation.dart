import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/constants/svgs/app_vectors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:bloom_app/views/screens/bottom_navigation/chat/chat_view.dart';
import 'package:bloom_app/views/screens/drawer/drawer_view.dart';
import 'package:bloom_app/views/screens/bottom_navigation/profile/edit_bio.dart';
import 'package:bloom_app/views_models/bottom_navigation/bottom_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BLooMBottomNavigation extends StatelessWidget with BLooMBackroundMixin {
  const BLooMBottomNavigation({super.key, this.whichPage = 0});
  final int whichPage;

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return GetBuilder(
        init: BottomNavigationController(
            indecurrentNavigationIndexxPage: whichPage),
        builder: (controller) {
          return Container(
            decoration: bLooMGradient(),
            child: Scaffold(
                extendBody: true,
                key: scaffoldKey,
                appBar: controller.currentNavigationIndex == 0
                    ? AppBarComponent(
                        title: 'BLooM',
                        backgroundColor: AppColors.magentaPink,
                        elevation: 0.0,
                        fontSize: 24,
                        actions: [
                          GestureDetector(
                            onTap: () {
                              scaffoldKey.currentState!.openEndDrawer();
                            },
                            child: SvgPicture.asset(
                              AppVectors.drawerIcon,
                              height: 24.h,
                              width: 24.w,
                            ),
                          ),
                          HorizontalSpacing(16.w)
                        ],
                      ) as PreferredSizeWidget
                    : controller.currentNavigationIndex == 2
                        ? const AppBarComponent(
                            title: "Notifications",
                            centerTitle: true,
                          )
                        : AppBarComponent(
                            title: "Profile",
                            centerTitle: true,
                            actions: [
                              InkWell(
                                borderRadius: BorderRadius.circular(200),
                                highlightColor:
                                    AppColors.magicMint.withOpacity(0.5),
                                splashColor:
                                    AppColors.magicMint.withOpacity(0.5),
                                focusColor:
                                    AppColors.magicMint.withOpacity(0.5),
                                onTap: () {
                                  Get.to(() => const EditBioView(),
                                      transition:
                                          Transition.rightToLeftWithFade);
                                },
                                child: Icon(
                                  Icons.edit,
                                  color: AppColors.black,
                                  size: 18.h,
                                ).marginAll(20),
                              ),
                              HorizontalSpacing(16.w)
                            ],
                          ),
                endDrawer: controller.currentNavigationIndex == 0
                    ? const DrawerView()
                    : null,
                bottomNavigationBar: controller.currentNavigationIndex == 1
                    ? const SizedBox.shrink()
                    : Container(
                        // height: 74.h,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                            color: AppColors.magentaPink,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.r),
                              topRight: Radius.circular(16.r),
                            )),
                        child: BottomNavigationBar(
                          elevation: 0,
                          type: BottomNavigationBarType.fixed,
                          selectedFontSize: 10.sp,
                          unselectedFontSize: 10.sp,
                          selectedLabelStyle: Fonts.noto(
                              context, AppColors.white, 10, FontWeight.w500),
                          selectedItemColor: AppColors.white,
                          unselectedItemColor:
                              AppColors.white.withOpacity(0.60),
                          unselectedLabelStyle: Fonts.noto(
                              context, AppColors.white, 10, FontWeight.w500),
                          showSelectedLabels: true,
                          showUnselectedLabels: true,
                          backgroundColor: Colors.transparent,
                          onTap: (value) {
                            value == 1
                                ? Get.to(() => const ChatView(),
                                    transition: Transition.downToUp)
                                : controller.setNavigationIndex(value);
                          },
                          currentIndex: controller.currentNavigationIndex,
                          items: List.generate(
                            controller.icon.length,
                            (index) => BottomNavigationBarItem(
                              label: controller.label[index],
                              icon: SvgPicture.asset(
                                controller.icon[index],
                                height: 24.h,
                                width: 24.w,
                              ),
                              activeIcon: SvgPicture.asset(
                                controller.fillIcon[index],
                                height: 24.h,
                                width: 24.w,
                              ),
                            ),
                          ),
                        ),
                      ),

                // ),
                body:
                    controller.destination[controller.currentNavigationIndex]),
          );
        });
  }
}
