import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:bloom_app/views/components/button_component.dart';
import 'package:bloom_app/views_models/auth/verification/verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

// ignore: must_be_immutable
class VerificationScreen extends StatelessWidget with BLooMBackroundMixin {
  VerificationScreen({super.key, required this.email});
  String email;
  final verificationController = Get.put(VerificationController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: const AppBarComponent(),
        extendBodyBehindAppBar: true,
        body: Container(
          height: double.infinity,
          padding: EdgeInsets.only(top: 120.h),
          decoration: bLooMGradient(),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Verification Code',
                    style: Fonts.caveatBrush(
                        context, AppColors.black, 24, FontWeight.w400),
                  ),
                  VerticalSpacing(16.h),
                  Text(
                    'Enter the 4 digit code we sent to $email',
                    textAlign: TextAlign.center,
                    style: Fonts.noto(
                        context, AppColors.raisinBlack, 16, FontWeight.w400),
                  ),
                  VerticalSpacing(6.h),
                  Text(
                    'Wrong email?',
                    style: Fonts.noto(
                        context, AppColors.blue, 13, FontWeight.w500),
                  ),
                  VerticalSpacing(55.h),
                  Pinput(
                    controller: verificationController.otpController,
                    onChanged: (v) {
                      verificationController.buttonVisibilty();
                    },
                    autofocus: true,
                    length: 4,
                    focusNode: verificationController.verficationCodeNode,

                    defaultPinTheme: PinTheme(
                        margin: EdgeInsets.symmetric(horizontal: 7.w),
                        textStyle: Fonts.noto(
                            context, AppColors.black, 24, FontWeight.w400),
                        height: 56.h,
                        width: 38.w,
                        decoration: const BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                            color: Color(0xffEAE1F2),
                            width: 3,
                          ),
                        ))),

                    focusedPinTheme: PinTheme(
                        margin: EdgeInsets.symmetric(horizontal: 7.w),
                        textStyle: Fonts.noto(
                            context, AppColors.black, 24, FontWeight.w400),
                        height: 38.h,
                        width: 38.w,
                        decoration: const BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                            color: Color(0xffEAE1F2),
                            width: 3,
                          ),
                        ))),
                    // onCompleted: (pin) => print(pin),
                  ),
                  VerticalSpacing(20.h),
                  // const Spacer(),
                  Obx(
                    () => Column(
                      children: [
                        verificationController.resendCount.value < 3
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  verificationController.resendSeconds.value ==
                                          0
                                      ? Row(
                                          children: [
                                            Text(
                                              'Didn’t receive code?',
                                              overflow: TextOverflow.ellipsis,
                                              style: Fonts.noto(
                                                  context,
                                                  AppColors.black,
                                                  12,
                                                  FontWeight.w600),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                verificationController
                                                    .resendSeconds.value = 60;

                                                verificationController
                                                        .resendCount =
                                                    verificationController
                                                        .resendCount++;

                                                verificationController
                                                    .startResendTimer();

                                                verificationController
                                                    .resendOtp();
                                              },
                                              child: Text(
                                                ' Resend now',
                                                overflow: TextOverflow.ellipsis,
                                                style: Fonts.noto(
                                                    context,
                                                    AppColors.darkGreen,
                                                    12,
                                                    FontWeight.w700),
                                              ),
                                            ),
                                          ],
                                        )
                                      : RichText(
                                          overflow: TextOverflow.ellipsis,
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text: 'Resend code in ',
                                              style: Fonts.noto(
                                                  context,
                                                  AppColors.black,
                                                  12,
                                                  FontWeight.w600),
                                            ),
                                            TextSpan(
                                              text:
                                                  "0:${verificationController.resendSeconds.value}"
                                                      .toString(),
                                              style: Fonts.noto(
                                                  context,
                                                  AppColors.darkGreen,
                                                  12,
                                                  FontWeight.w700),
                                            )
                                          ]))
                                ],
                              )
                            : Obx(
                                () => Text(
                                  "Try again after ${verificationController.formattedTime.value} minutes",
                                  overflow: TextOverflow.ellipsis,
                                  style: Fonts.noto(context, AppColors.black,
                                      13.sp, FontWeight.w600),
                                ),
                              ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: Obx(
                  //     () => SizedBox(
                  //       width: double.infinity,
                  //       child: ButtonComponent(
                  //         onPressed: verificationController.otpVerify,
                  //         isDisable: verificationController.disableButton.value,
                  //         buttonText: "Verify",
                  //         isLoading: verificationController.isLoading.value,
                  //         height: 48.h,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // const VerticalSpacing()
                ],
              ),
            ),
          ),
        ),
        // extendBody: true,
        // bottomNavigationBar: SizedBox(
        //   height: 100.h,
        // ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Obx(
          () => SizedBox(
            width: double.infinity,
            child: ButtonComponent(
              onPressed: verificationController.otpVerify,
              isDisable: verificationController.disableButton.value,
              buttonText: "Verify",
              isLoading: verificationController.isLoading.value,
              height: 48.h,
            ),
          ).paddingAll(10),
        ),
      ),
    );
  }
}
