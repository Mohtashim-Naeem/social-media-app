// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:nykn/constants/colors/app_colors.dart';
// import 'package:nykn/constants/images/app_images.dart';
// import 'package:nykn/constants/svgs/app_vectors.dart';
// import 'package:nykn/controllers/bottom_navigation/bottom_navigation_controller.dart';
// import 'package:nykn/data/firebase/firebase_auth_repo.dart';
// import 'package:nykn/data/network/network_api_service.dart';
// import 'package:nykn/data/repository/logout_repo.dart';
// import 'package:nykn/utils/fonts.dart';
// import 'package:nykn/utils/spacing.dart';
// import 'package:nykn/utils/utils.dart';
// import 'package:nykn/views/screens/auth/auth_screen.dart';
// import 'package:nykn/views/screens/bottom_navigation/bottom_navigation_screen.dart';
// import 'package:nykn/views/screens/profile/profile_view.dart';
// import 'package:nykn/views/screens/reviews/my_review_screen.dart';
// import 'package:nykn/views/screens/settings/settings_screen.dart';
// import 'package:nykn/views/widgets/custom_dialog_widget.dart';
// import 'package:nykn/views/widgets/drawer_tile.dart';

// class DrawerComponent extends StatelessWidget {
//   const DrawerComponent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.only(
//         topRight: Radius.circular(20.r),
//       ),
//       child: SizedBox(
//         width: Utils.isTablet(context) ? 158.w : 238.w,
//         child: Drawer(
//           backgroundColor: AppColors.white,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Align(
//                   child: Image.asset(
//                     AppImages.appLogo,
//                     height: 180.h,
//                     width: 180.w,
//                   ),
//                 ),
//                 VerticalSpacing(21.h),
//                 DrawerTile(
//                   title: 'Home',
//                   icon: AppVectors.homeIcon,
//                   onTap: () {
//                     if (Get.currentRoute != BottomNavigationScreen.routeName) {
//                       Get.offAll(() => const BottomNavigationScreen());
//                     } else {
//                       Scaffold.of(context).closeDrawer();
//                       final navController =
//                           Get.find<BottomNavigationController>();
//                       navController.setNavigationIndex(1);
//                     }
//                   },
//                 ),
//                 DrawerTile(
//                   title: 'Profile',
//                   icon: AppVectors.profileIcon,
//                   onTap: () {
//                     Get.offAll(() => ProfileView());
//                   },
//                 ),
//                 DrawerTile(
//                   onTap: () {
//                     Get.offAll(() => const SettingsScreen());
//                   },
//                   title: 'Settings',
//                   icon: AppVectors.settingsIcon,
//                 ),
//                 DrawerTile(
//                   onTap: () {
//                     Scaffold.of(context).closeDrawer();
//                     Utils.urllaunch(
//                         'https://admin.nowyouknownashville.com/terms-and-conditions');
//                     // Get.offAll(() => TermsWebView());
//                   },
//                   title: 'Terms & Conditions',
//                   icon: AppVectors.termsIcon,
//                 ),
//                 DrawerTile(
//                   onTap: () {
//                     Scaffold.of(context).closeDrawer();
//                     Utils.urllaunch(
//                         'https://admin.nowyouknownashville.com/privacy-policy');
//                     // Get.offAll(() => PrivacyPolicyWebView());
//                   },
//                   title: 'Privacy Policy',
//                   icon: AppVectors.privacyIcon,
//                 ),
//                 DrawerTile(
//                   onTap: () {
//                     Get.offAll(() => const MyReviewScreen());
//                   },
//                   title: 'My Reviews',
//                   icon: AppVectors.reviewIcon,
//                 ),
//                 ListTile(
//                   contentPadding: EdgeInsets.zero,
//                   onTap: () {
//                     // Get.back();
//                     // Navigator.pop(context);
//                     Scaffold.of(context).closeDrawer();
//                     showDialog(
//                       context: context,
//                       builder: (context) {
//                         return CustomDialogWidget(
//                           title: 'Logout',
//                           subtitle: 'Are You Sure You want to Logout?',
//                           cancelText: 'Cancel',
//                           confirmText: 'Logout',
//                           confirmOnTap: () async {
//                             Utils.storage.write("social", false);
//                             var apiRepo = LogOutRepo();
//                             await FirebaseAuthRepo.googleSignOut();
//                             await FirebaseAuth.instance.signOut();

//                             apiRepo.logOutStatus();
//                             NetworkApiService.removeToken();
//                             Get.offAll(() => const AuthScreen());
//                           },
//                         );
//                       },
//                     );
//                   },
//                   leading: SizedBox(
//                     height: 20.h,
//                     width: 20.w,
//                     child: SvgPicture.asset(
//                       AppVectors.logoutIcon,
//                       colorFilter: const ColorFilter.mode(
//                           AppColors.steelBlue, BlendMode.srcIn),
//                     ),
//                   ),
//                   title: Text(
//                     'Logout',
//                     style: Fonts.axiforma(
//                       context,
//                       AppColors.steelBlue,
//                       13,
//                       FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ],
//             ).paddingSymmetric(vertical: 30.h, horizontal: 24.w),
//           ),
//         ),
//       ),
//     );
//   }
// }
