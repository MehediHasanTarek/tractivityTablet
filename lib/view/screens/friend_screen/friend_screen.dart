// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tractivity_app/core/app_routes/app_routes.dart';
import 'package:tractivity_app/utils/app_colors/app_colors.dart';
import 'package:tractivity_app/utils/app_const/app_const.dart';
import 'package:tractivity_app/utils/app_strings/app_strings.dart';
import 'package:tractivity_app/utils/toast.dart';
import 'package:tractivity_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:tractivity_app/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:tractivity_app/view/components/custom_text/custom_text.dart';
import 'package:tractivity_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:tractivity_app/view/components/nav_bar/nav_bar.dart';
import 'package:tractivity_app/view/screens/adminstrator_home_screen/alert_dialog_event.dart';
import 'package:tractivity_app/view/screens/friend_screen/inner_widget/custom_friend_list.dart';
import 'package:tractivity_app/view/screens/profile_screen/events_profile_screen/events_controller/events_controller.dart';
class FriendScreen extends StatelessWidget {
  FriendScreen({super.key});

  final EventsController eventsController = Get.find<EventsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(titleName: AppStrings.friend,),
      body: LayoutBuilder(builder: (context,constraints){

        final isTablet = constraints.maxWidth > 600;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
            child: Obx(() {
              
                  return Column(
                    children: [
                      ///========= Tab Bar ========
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              eventsController.friendList.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                eventsController.currentIndex.value = index;
                            //    eventsController.update();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 8),
                                  // height: 40.h,
                                  //width: screenWidth / 3,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.primary, width: 0.6),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                    color:
                                    eventsController.currentIndex.value == index
                                        ? AppColors.primary
                                        : AppColors.white.withOpacity(0),
                                  ),
                                  child: CustomText(
                                    text: eventsController.friendList[index],
                                    fontSize: isTablet?14:14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),

                      SizedBox(height: 16,),

                      CustomTextField(
                          hintText: AppStrings.searchForSomeone,
                          suffixIcon: Icon(
                            Icons.search,
                            color: AppColors.black_60,
                            size:isTablet?32: 24,
                          )),

                      SizedBox(height: 20.h,),

                      ///========= Friends Remove List ========
                      if(eventsController.currentIndex.value == 0)
                        Column(
                            children: List.generate(3, (index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CustomNetworkImage(
                                          imageUrl: AppConstants.profileImage,
                                          height: 60,
                                          width: 60,
                                          boxShape: BoxShape.circle,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text: "Mehedi Hassan",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.black,
                                            ),
                                            CustomText(
                                              text: "married",
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.black_80,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: (){

                                        showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                            backgroundColor: Colors.white,
                                            insetPadding: EdgeInsets.all(8),
                                            contentPadding: EdgeInsets.all(8),
                                            title: SizedBox(),
                                            content: SizedBox(
                                              width: MediaQuery.sizeOf(context).width,
                                              child: AlertDialogEvent(title: "Are you sure you want to \n Remove this Friends?",discription: "",),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: AppColors.primary,
                                          borderRadius: BorderRadius.circular(10.r),
                                        ),
                                        child: CustomText(
                                          text: "Remove",
                                          color: AppColors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            })
                        ),

                      ///========= Friends Invite List ========
                      if(eventsController.currentIndex.value == 1)
                        Column(
                            children: List.generate(6, (index) {
                              return GestureDetector(
                                onTap: (){
                                 /// Get.toNamed(AppRoutes.userEventProfile);
                                },
                                child: CustomFriendsList(
                                  image: AppConstants.profileImage,
                                  name: "Mehedi Hassan",
                                  userName: "single",
                                  reversText: "Invite",
                                ),
                              );
                            })
                        ),

                      ///========= Friends Confirm List ========
                      if(eventsController.currentIndex.value == 2)
                        Column(
                            children: List.generate(6, (index) {
                              return GestureDetector(
                                onTap: (){
                                /// Get.toNamed(AppRoutes.userEventProfile);
                                },
                                child: CustomFriendsList(
                                  image: AppConstants.profileImage,
                                  name: "Mehedi Hassan",
                                  userName: "student",
                                  reversText: "Confirm",
                                ),
                              );
                            })
                        )
                    ],
                  );
                }
            ),
          ),
        );
      }),
      bottomNavigationBar: NavBar(currentIndex: 1),
    );
  }
}
