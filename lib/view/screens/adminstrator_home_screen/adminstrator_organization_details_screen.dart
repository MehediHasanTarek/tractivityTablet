
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tractivity_app/core/app_routes/app_routes.dart';
import 'package:tractivity_app/utils/app_colors/app_colors.dart';
import 'package:tractivity_app/utils/app_const/app_const.dart';
import 'package:tractivity_app/utils/toast.dart';
import 'package:tractivity_app/view/components/custom_button/custom_button.dart';
import 'package:tractivity_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:tractivity_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:tractivity_app/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:tractivity_app/view/components/custom_text/custom_text.dart';
import 'package:tractivity_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:tractivity_app/view/screens/adminstrator_home_screen/alert_dialog_event.dart';
import 'package:tractivity_app/view/screens/adminstrator_home_screen/controller/administratior_controller.dart';

class AdminstratorOrganizationDetailsScreen extends StatefulWidget {
  const AdminstratorOrganizationDetailsScreen({super.key});

  @override
  State<AdminstratorOrganizationDetailsScreen> createState() => _AdminstratorOrganizationDetailsScreenState();
}

class _AdminstratorOrganizationDetailsScreenState extends State<AdminstratorOrganizationDetailsScreen> {

  final administratorController = Get.put(AdministratiorController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){

      final isTablet = constraints.maxWidth > 600;

      return Scaffold(
        appBar: CustomRoyelAppbar(
          leftIcon: true,
          titleName: "Organization Details",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                CustomText(
                  textAlign: TextAlign.start,
                  text: "Organization",
                  fontSize:isTablet?6.sp: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                  bottom: 5,
                ),

                CustomText(
                  text: "Donation Organization",
                  fontSize:isTablet?6.sp: 16.sp,
                  color: AppColors.black_80,
                  fontWeight: FontWeight.w600,
                  bottom: 6.h,
                ),

                CustomText(
                  text: "Empowering communities  worldwide  through education, healthcare,  and sustainable development initiatives.",
                  fontSize: 12,
                  color: AppColors.black_02,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  maxLines: 3,
                  bottom: 4.h,// Add ellipsis at the end if the text overflows.
                ),


                const Divider(
                  color: Colors.black54,
                ),

                CustomText(
                  textAlign: TextAlign.start,
                  text: "Mission:",
                  fontSize:isTablet?6.sp: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),

                  SizedBox(
                  height: 16.h,
                ),

                Column(
                    children: List.generate(3, (index) {
                      return GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoutes.adminstratorMissionDetailsScreen);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height:isTablet?140.h: 140.h,
                            decoration: BoxDecoration(
                              color: AppColors.grey_3.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.only(top: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.only(left: 8,right: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [

                                      CustomText(
                                        text: "${index+1}.Mission Horizons Foundation",
                                        fontSize: 16,
                                        color: AppColors.black_80,
                                        fontWeight: FontWeight.w600,
                                      ),

                                      const CustomText(
                                        text: "22-12-2025",
                                        fontSize: 12,
                                        color: AppColors.black_80,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      const CustomText(
                                        text: "Empowering communities  worldwide  through education, healthcare,  and sustainable development initiatives.",
                                        fontSize: 12,
                                        color: AppColors.black_80,
                                        fontWeight: FontWeight.w400,
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,// Add ellipsis at the end if the text overflows.
                                      ),

                                    SizedBox(
                                      height: 8.h,
                                    ),
                                      Row(
                                        children: [
                                          CustomButton(
                                            onTap: () {

                                              showDialog(
                                                context: context,
                                                builder: (ctx) => AlertDialog(
                                                  backgroundColor: Colors.white,
                                                  insetPadding: EdgeInsets.all(8),
                                                  contentPadding: EdgeInsets.all(8),
                                                  title: SizedBox(),
                                                  content: SizedBox(
                                                    width: MediaQuery.sizeOf(context).width,
                                                    child: AlertDialogEvent(title: "Are you sure you want to \n delete ?",discription: "",),
                                                  ),
                                                ),
                                              );
                                            },
                                            title: "Delete",
                                            width: 60.w,
                                            height: 32.h,
                                            textColor: AppColors.black,
                                            fillColor: AppColors.primary,
                                            fontSize: 12,
                                          ),

                                          SizedBox(
                                            width:isTablet?12.h: 8.h,
                                          ),

                                          CustomButton(
                                            onTap: () {

                                              showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                builder: (ctx) => AlertDialog(
                                                  backgroundColor: Colors.white,
                                                  insetPadding: EdgeInsets.all(8),
                                                  contentPadding: EdgeInsets.all(8),
                                                  //   clipBehavior: Clip.antiAliasWithSaveLayer,
                                                  title:Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      ///Edit Mission
                                                      const CustomText(
                                                        text: "Edit Mission",
                                                        fontSize: 24,
                                                        color: AppColors.black,
                                                        fontWeight: FontWeight.w500,
                                                        bottom: 8,
                                                      ),

                                                      Align(
                                                        alignment: Alignment.centerRight,
                                                        child: InkWell(
                                                            onTap: () {

                                                              Navigator.of(context).pop();

                                                            },
                                                            child: const Icon(
                                                              Icons.close,
                                                              size: 32,
                                                              color: Colors.black,
                                                            )),
                                                      )
                                                    ],
                                                  ),
                                                  content: Obx(
                                                          () {
                                                        return SingleChildScrollView(
                                                          child: SizedBox(
                                                            width: MediaQuery.sizeOf(context).width,
                                                            ///height: MediaQuery.sizeOf(context).height/1.4,

                                                            child: Column(
                                                              children: [

                                                                Align(
                                                                  alignment: Alignment.topLeft,
                                                                  child: CustomText(
                                                                    text: "Organization",
                                                                    fontSize:isTablet?6.sp: 14.sp,
                                                                    color: AppColors.black,
                                                                    fontWeight: FontWeight.bold,
                                                                    bottom: 8,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  padding: EdgeInsets.all(8),
                                                                  decoration: BoxDecoration(
                                                                    color: AppColors.grey_5.withOpacity(0.5),
                                                                    borderRadius: BorderRadius.circular(15),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [

                                                                      CustomText(
                                                                        text: "Donation Administrator",
                                                                        fontSize: 16,
                                                                        color: AppColors.black_80,
                                                                        fontWeight: FontWeight.w600,
                                                                        textAlign: TextAlign.start,
                                                                        left: 8,
                                                                      ),

                                                                      Padding(
                                                                        padding: const EdgeInsets.only(left: 8,right: 8),
                                                                        child: CustomText(
                                                                          text: "Empowering communities  worldwide  through education, healthcare.",
                                                                          fontSize: 12.sp,
                                                                          color: AppColors.black_80,
                                                                          fontWeight: FontWeight.w400,
                                                                          textAlign: TextAlign.start,
                                                                          maxLines: 2,
                                                                          overflow: TextOverflow.ellipsis, // Add ellipsis at the end if the text overflows.
                                                                          // maxLines: 3,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 12,
                                                                ),

                                                                const Align(
                                                                  alignment: Alignment.topLeft,
                                                                  child: CustomText(
                                                                    text: "Add Organizer",
                                                                    fontSize: 14,
                                                                    color: AppColors.black,
                                                                    fontWeight: FontWeight.bold,
                                                                    bottom: 8,
                                                                  ),
                                                                ),

                                                                Container(
                                                                  ///    padding: EdgeInsets.only(left: 8,right: 8),
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(10),
                                                                      color: Colors.white,
                                                                      boxShadow: [
                                                                        const BoxShadow(color: Colors.black, spreadRadius: 1),
                                                                      ],
                                                                    ),
                                                                    /// height: 70.h,
                                                                    child: ExpansionTile(
                                                                      title: CustomText(
                                                                        text: "Select Organizer",
                                                                        fontSize:isTablet? 6.sp:14.sp,
                                                                        color: AppColors.black,
                                                                        fontWeight: FontWeight.w500,
                                                                        textAlign: TextAlign.start,
                                                                      ),
                                                                      children:  [

                                                                        ///======== Search Bar ==============
                                                                        const CustomTextField(
                                                                          hintText: "Search",
                                                                          fillColor: AppColors.neutral02,
                                                                          suffixIcon: Icon(
                                                                            Icons.search,
                                                                            color: AppColors.black_60,
                                                                          ),
                                                                        ),

                                                                        const SizedBox(
                                                                          height: 12,
                                                                        ),

                                                                        Column(
                                                                          children: List.generate(
                                                                              3, (index){

                                                                            return Column(
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsets.all(4.0),
                                                                                  child: Container(
                                                                                    height:isTablet?130.h: 110.h,
                                                                                    decoration: BoxDecoration(
                                                                                      color: AppColors.grey_3.withOpacity(0.5),
                                                                                      borderRadius: BorderRadius.circular(15),
                                                                                    ),
                                                                                    padding: EdgeInsets.all(12),
                                                                                    child: Column(
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      children: [

                                                                                        Row(
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [

                                                                                            Row(
                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [

                                                                                                CustomText(
                                                                                                  text: "${index+1 }.",
                                                                                                  fontSize: isTablet?6.sp:14.sp,
                                                                                                  color: AppColors.black_80,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),

                                                                                                CustomText(
                                                                                                  text: "Mission Horizons Foundation",
                                                                                                  fontSize:isTablet?6.sp: 14.sp,
                                                                                                  color: AppColors.black_80,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  overflow: TextOverflow.clip,
                                                                                                ),
                                                                                              ],
                                                                                            ),

                                                                                          ],
                                                                                        ),

                                                                                        Row(
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                                                                          children: [

                                                                                            Flexible(
                                                                                              child: SizedBox(
                                                                                                width:isTablet?300.w: 250.w,
                                                                                                child: CustomText(
                                                                                                  text: "Empowering communities  worldwide  through education, healthcare,  and sustainable development initiatives.",
                                                                                                  fontSize: 12,
                                                                                                  color: AppColors.black_80,
                                                                                                  fontWeight: FontWeight.w400,
                                                                                                  textAlign: TextAlign.start,
                                                                                                  overflow: TextOverflow.clip,
                                                                                                  maxLines: 2,
                                                                                                ),
                                                                                              ),
                                                                                            ),

                                                                                            Row(
                                                                                              children: [

                                                                                                Checkbox(
                                                                                                  checkColor: AppColors.white,
                                                                                                  activeColor: AppColors.primary,
                                                                                                  shape: RoundedRectangleBorder(
                                                                                                    borderRadius: BorderRadius.circular(3.0),
                                                                                                  ),
                                                                                                  side: const BorderSide(
                                                                                                    // ======> CHANGE THE BORDER COLOR HERE <======
                                                                                                    color: AppColors.primary,
                                                                                                    // Give your checkbox border a custom width
                                                                                                    width: 1.4,
                                                                                                  ),
                                                                                                  value: administratorController.selectedOranization.value,
                                                                                                  onChanged: (bool? value) {

                                                                                                    administratorController.selectedLeader.value = value!;

                                                                                                  },
                                                                                                ),

                                                                                              ],
                                                                                            ),

                                                                                          ],
                                                                                        ),

                                                                                        SizedBox(
                                                                                          height: 4.h,
                                                                                        ),

                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          }

                                                                          ),
                                                                        )
                                                                      ],
                                                                    )
                                                                ),


                                                                const SizedBox(
                                                                  height: 12,
                                                                ),
                                                                CustomFormCard(
                                                                    title: "Name",
                                                                    hintText: "Name",
                                                                    fontSize: isTablet?16:16,
                                                                    hasBackgroundColor: true,
                                                                    controller: administratorController.missionNameController.value),

                                                                SizedBox(
                                                                  height: 12.h,
                                                                ),

                                                                CustomFormCard(
                                                                    title: "Description",
                                                                    hintText: "Description",
                                                                    fontSize: isTablet?16:16,
                                                                    hasBackgroundColor: true,
                                                                    controller: administratorController.missionDescriptionController.value),


                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 12,right: 12,bottom: 12),
                                                                  child: CustomButton(
                                                                    onTap: () {

                                                                      if(administratorController.organizationIdList.isEmpty){
                                                                        Toast.errorToast("Select Oranization is Empty!!");
                                                                      }else if(administratorController.leaderIdList.isEmpty){
                                                                        Toast.errorToast("Select Oranization is Empty!!");
                                                                      }

                                                                    },
                                                                    title: "Edit",
                                                                    height: 60.h,
                                                                    textColor: AppColors.black,
                                                                    fillColor: AppColors.primary,
                                                                    fontSize: 12,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                  ),
                                                ),
                                              );
                                            },
                                            title: "Edit",
                                            width: 60.w,
                                            height: 32.h,
                                            textColor: AppColors.black,
                                            fillColor: AppColors.primary,
                                            fontSize: 12,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
              ],
            ),
          ),
        ),
      );
    });
  }
}
