
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tractivity_app/core/app_routes/app_routes.dart';
import 'package:tractivity_app/utils/app_colors/app_colors.dart';
import 'package:tractivity_app/utils/app_strings/app_strings.dart';
import 'package:tractivity_app/utils/toast.dart';
import 'package:tractivity_app/view/components/custom_button/custom_button.dart';
import 'package:tractivity_app/view/components/custom_loader/custom_loader.dart';
import 'package:tractivity_app/view/components/custom_pin_code/custom_pin_code.dart';
import 'package:tractivity_app/view/components/custom_text/custom_text.dart';
import 'package:tractivity_app/view/screens/auth_screen/controller/auth_controller.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {

  String? email;

  final authController = Get.put(AuthController());



  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){

      final isTablet = constraints.maxWidth > 600;

      return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height/1.1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  SizedBox(
                    height: 16.h,
                  ),

                  CustomText(
                    text: AppStrings.serveOut,
                    fontSize:isTablet?18.sp: 28.sp,
                    fontWeight: FontWeight.w600,
                    bottom: 20.h,
                  ),

                  Column(
                    children: [

                      CustomText(
                        top: 80.h,
                        text: AppStrings.enterCode,
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        bottom: 20.h,
                      ),
                      CustomText(
                        text: AppStrings.enterTheCodeTitle,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        maxLines: 2,
                        bottom: 30.h,
                        color: AppColors.black,
                      ),
                      CustomPinCode(controller: authController.otpController.value),

                      SizedBox(height: 20.h),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          CustomText(
                            text: AppStrings.ididntFind,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black_04,
                            right: 10,
                          ),
                          GestureDetector(
                            onTap: (){

                        ///   authController.otpResetLoading.value? CustomLoader(): authController.otpResetValidation(email.toString());
                            },
                            child: CustomText(
                              text: AppStrings.sendAgain,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: AppColors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  ///============ Login Button ============
                  CustomButton(
                    onTap: () {

                      Get.toNamed(AppRoutes.forgotPassword);

                    },
                    title: AppStrings.confirm,
                    height: isTablet?60.h:60.h,
                    fontSize: isTablet ? 10.sp : 14.sp,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });

  }
}

