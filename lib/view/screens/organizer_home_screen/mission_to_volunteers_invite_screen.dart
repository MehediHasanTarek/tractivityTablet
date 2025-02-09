
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tractivity_app/core/app_routes/app_routes.dart';
import 'package:tractivity_app/utils/app_colors/app_colors.dart';
import 'package:tractivity_app/utils/app_const/app_const.dart';
import 'package:tractivity_app/utils/app_strings/app_strings.dart';
import 'package:tractivity_app/view/components/custom_button/custom_button.dart';
import 'package:tractivity_app/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:tractivity_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:tractivity_app/view/screens/friend_screen/inner_widget/custom_friend_list.dart';


class MissionToVolunteersInviteScreen extends StatefulWidget {
  const MissionToVolunteersInviteScreen({super.key});

  @override
  State<MissionToVolunteersInviteScreen> createState() => _MissionToVolunteersInviteScreenState();
}

class _MissionToVolunteersInviteScreenState extends State<MissionToVolunteersInviteScreen> {
  @override
  Widget build(BuildContext context) {
      return LayoutBuilder(builder: (context,constraints){

        final isTablet = constraints.maxWidth > 600;

        return Scaffold(
          appBar: const CustomRoyelAppbar(
            titleName: "Invite Volunteers",
            leftIcon: true,
          ),
          body:Padding(
            padding: const EdgeInsets.all(16.0),
            child:Column(
              children: [

                ///============ search ======================================
                const CustomTextField(
                    hintText: AppStrings.searchEvent,
                    fillColor: AppColors.neutral02,
                    suffixIcon: Icon(
                      Icons.search,
                      color: AppColors.black_60,
                    )),

                const SizedBox(
                  height: 12,
                ),

                Column(
                    children: List.generate(6, (index) {
                      return GestureDetector(
                        onTap: (){

                        },
                        child: CustomFriendsList(
                          image: AppConstants.profileImage,
                          name: "Mehedi Hassan",
                          userName: "Single",
                          reversText: "Select",
                        ),
                      );
                    })
                )
              ],
            ),
          ),

          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomButton(onTap: (){

                }, title: "Done",fontSize:isTablet?9.sp: 14.sp,),
              ),

            ],
          ),
        );
      });
  }
}
