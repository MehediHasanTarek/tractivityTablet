
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tractivity_app/core/app_routes/app_routes.dart';
import 'package:tractivity_app/utils/app_colors/app_colors.dart';
import 'package:tractivity_app/utils/app_const/app_const.dart';
import 'package:tractivity_app/utils/app_strings/app_strings.dart';
import 'package:tractivity_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:tractivity_app/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:tractivity_app/view/components/custom_text/custom_text.dart';
import 'package:tractivity_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:tractivity_app/view/screens/adminstrator_home_screen/alert_dialog_event.dart';
import 'package:tractivity_app/view/screens/friend_screen/inner_widget/custom_friend_list.dart';

class RemoveFriendScreen extends StatefulWidget {
  const RemoveFriendScreen({super.key});

  @override
  State<RemoveFriendScreen> createState() => _RemoveFriendScreenState();
}

class _RemoveFriendScreenState extends State<RemoveFriendScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomRoyelAppbar(titleName: AppStrings.removeFriend,leftIcon: true,),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
          child: Column(
            children: [


              SizedBox(height: 10,),

              const CustomTextField(
                  hintText: AppStrings.searchForSomeone,
                  suffixIcon: Icon(
                    Icons.search,
                    color: AppColors.black_60,
                  )),

              SizedBox(height: 20.h,),

      /*        CustomFriendsList(
                image: AppConstants.profileImage,
                name: "Mehedi Hassan",
                userName: "married",
                reversText: "Remove",
              ),*/

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


            ],
          ),
        ),
      ),

    );
  }
}
