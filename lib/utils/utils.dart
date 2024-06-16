import 'dart:math';

import 'package:bloom_app/views/components/camera_bottomsheet.dart';
import 'package:bloom_app/views/components/dialog_component.dart';
import 'package:bloom_app/views/screens/auth/signin/sigin_view.dart';
import 'package:bloom_app/views/screens/drawer/comunity_rule/community_rule_view.dart';
import 'package:bloom_app/views/screens/drawer/greeting/greeting_view.dart';
import 'package:bloom_app/views/screens/drawer/settings/change_password/change_password_view.dart';
import 'package:bloom_app/views/screens/drawer/settings/delete_acc/delete_acc_view.dart';
import 'package:bloom_app/views/screens/drawer/settings/notification/notification_settings_view.dart';
import 'package:bloom_app/views/screens/drawer/settings/privacy_policy/privacy_policy.dart';
import 'package:bloom_app/views/screens/drawer/settings/settings_view.dart';
import 'package:bloom_app/views/screens/drawer/settings/terms_condition/terms_condition_view.dart';
import 'package:bloom_app/views/screens/drawer/subscriptions/subscription_plans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/constants/svgs/app_vectors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static bool isTablet(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= 500;
  }

  static List<Widget> drawerDestinations = [
    const GreetingView(),
    const CommunityRulesView(),
    SubscriptionPlansView(),
    const SettingsView(),
    const SignInView(),
  ];
  static List<String> drawerTitles = [
    'Hey You!',
    'Community Rules',
    'Subscription Plans',
    'Settings',
    'Log Out',
  ];
  static List<String> drawerIcons = [
    AppVectors.heyYou,
    AppVectors.community,
    AppVectors.subscription,
    AppVectors.settings,
    AppVectors.logout,
  ];

  static const settingIconsDestinations = [
    NotificationSettingsView(),
    TermAndConditionView(),
    PrivacyPolicyView(),
    ChangePasswordView(),
    DeleteAccountView(),
  ];

  static List<String> settingIcons = [
    AppVectors.notificationSettingIcon,
    AppVectors.termsSettingIcon,
    AppVectors.privacySettingIcon,
    AppVectors.passwordSettingIcon,
    AppVectors.deleteSettingIcon,
  ];

  static List<String> settingTitles = [
    'Notifications',
    'Terms and Conditions',
    'Privacy Policy',
    'Change Password',
    'Delete Account',
  ];
  static List<String> settingDesc = [
    'Customize your notification preferences to stay informed about the latest uupdates and community activities.',
    'Familiarize yourself with our Terms and Services, ensuring a clear understanding of guidelines and rules for using our app.',
    'Explore our Privacy Policy to learn how we handle your data, ensuring transparency and security in your interactions with the app.',
    'To enhance the security of your account, you can change your password here.',
    'Safely and securely remove your account with just a few clicks, ensuring your privacy and preferences are respected.',
  ];

  static List<String> notificationSettingTitles = [
    'All Notifications',
    'Daily Devotion',
    'Announcement/Updates',
    'Admin Chat',
    'Brittany Talks',
  ];
  static List<String> notificationSettingDesc = [
    'Receive timely updates, devotions announcements and more to stay connected with the BLooM Community.',
    'Enable to receive daily devotions, spiritual insights and reflections.',
    'Stay informed about important announcements, events and updates from the BLooM Ministry.',
    'Enable to receive direct messages and updates from the BLooM admin for personalized communication.',
    'Get notified when Brittany’s shares new insights, talks and engaging content for your spiritual journey.',
  ];

  static String? validateEmail(String? email) {
    bool isValidEmail(String email) {
      return RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(email);
    }

    if (email == null || email.isEmpty) {
      return 'Please enter your email';
    } else if (!isValidEmail(email)) {
      return 'Invalid email format';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    if (value == null || value.isEmpty) {
      return 'Please enter password';
    } else if (!regex.hasMatch(value)) {
      return "Password should contain 8 characters, capital, small letter, number & special characters.";
    } else {
      return null;
    }
  }

  static urllaunch(url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  static String? validateName(String? value) {
    bool isValidName(String value) {
      const String pattern = r'^.{3,30}$';
      final regExp = RegExp(pattern);
      return regExp.hasMatch(value);
    }

    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    } else if (!isValidName(value)) {
      return 'Please enter a valid name with a minimum length of 3 characters';
    }
    return null;
  }

  static String? confirmValidatePassword(
      String password, String confirmPassword) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    if (confirmPassword.isEmpty || confirmPassword.isEmpty) {
      return 'Please enter password';
    } else if (!regex.hasMatch(confirmPassword)) {
      return "Password should contain 8 characters, capital, small letter, number & special characters.";
    } else if (password != confirmPassword) {
      return "Password not match";
    } else {
      return null;
    }
  }

  static String? calculateDistance(
      double lat1, double lon1, double lat2, double lon2,
      {bool inKilometers = false}) {
    const double earthRadius = 6371; // Radius of the Earth in kilometers

    // Convert latitude and longitude from degrees to radians
    double dLat = degreesToRadians(lat2 - lat1);
    double dLon = degreesToRadians(lon2 - lon1);

    // Haversine formula
    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(degreesToRadians(lat1)) *
            cos(degreesToRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double distance = earthRadius * c; // Distance in kilometers

    if (inKilometers) {
      return '${distance.toStringAsFixed(1)} km';
    } else {
      return '${(distance * 0.621371).toStringAsFixed(1)} miles';
    }
  }

  static double degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

// Function to estimate travel time based on distance and average speed
  static String estimateTravelTime(double distance, double averageSpeed) {
    // Calculate travel time in hours
    double travelTimeHours = distance / averageSpeed;

    // Convert travel time to minutes and seconds
    int totalTravelTimeMinutes = (travelTimeHours * 60).round();

    int travelTimeHoursResult = totalTravelTimeMinutes ~/ 60; // Getting hours
    int travelTimeMinutesResult =
        totalTravelTimeMinutes % 60; // Getting minutes

    if (travelTimeHoursResult > 0) {
      // If travel time exceeds 60 minutes, format it as hours and minutes
      return '$travelTimeHoursResult h $travelTimeMinutesResult min';
    } else {
      // Otherwise, return the travel time in minutes and seconds
      int travelTimeSeconds = ((travelTimeHours * 60) % 60).round();
      return '$totalTravelTimeMinutes min $travelTimeSeconds sec';
    }
  }

  static openBottomSheet(controller, isUploaded) {
    Get.bottomSheet(
      enableDrag: true,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      CameraBottomSheet(
        controller: controller,
        isUploaded: isUploaded,
      ),
    );
  }

  static void bLooMPopUp({
    required BuildContext context,
    required onYes,
    required String title,
    required String desc,
  }) {
    showDialog(
      context: context,
      builder: (context) => DialogComponent(
        title: title,
        subTitle: desc,
        onYes: onYes,
      ),
    );
  }

  static Widget successDialog(
      {required BuildContext context,
      required String text,
      required void Function()? onCross}) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 184.h,
          width: 283.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            gradient: const LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Color(0xFFD696DF), Color(0xFFABFFDE)],
            ),
          ),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: onCross ??
                          () {
                            Get.back();
                          },
                      icon: const Icon(Icons.close))),
              CircleAvatar(
                  radius: 28.r,
                  backgroundColor: AppColors.buttonColor,
                  child: Text(
                    String.fromCharCode(Icons.check_rounded.codePoint),
                    style: TextStyle(
                      inherit: false,
                      color: AppColors.black,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: Icons.check_rounded.fontFamily,
                      package: Icons.check_rounded.fontPackage,
                    ),
                  )),
              VerticalSpacing(17.h),
              Text(
                text,
                style: Fonts.noto(
                  context,
                  AppColors.raisinBlack,
                  14,
                  FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
