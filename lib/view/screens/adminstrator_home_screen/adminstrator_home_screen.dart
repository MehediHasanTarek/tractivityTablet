// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tractivity_app/core/app_routes/app_routes.dart';
import 'package:tractivity_app/helper/time_converter/time_converter.dart';
import 'package:tractivity_app/utils/app_colors/app_colors.dart';
import 'package:tractivity_app/utils/app_const/app_const.dart';
import 'package:tractivity_app/utils/app_icons/app_icons.dart';
import 'package:tractivity_app/utils/app_images/app_images.dart';
import 'package:tractivity_app/utils/app_strings/app_strings.dart';
import 'package:tractivity_app/utils/toast.dart';
import 'package:tractivity_app/view/components/custom_button/custom_button.dart';
import 'package:tractivity_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:tractivity_app/view/components/custom_image/custom_image.dart';
import 'package:tractivity_app/view/components/custom_loader/custom_loader.dart';
import 'package:tractivity_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:tractivity_app/view/components/custom_tab_selected/custom_tab_single_text.dart';
import 'package:tractivity_app/view/components/custom_text/custom_text.dart';
import 'package:tractivity_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:tractivity_app/view/components/nav_bar/adminstrator_navbar.dart';
import 'package:tractivity_app/view/screens/adminstrator_home_screen/alert_dialog_event.dart';
import 'package:tractivity_app/view/screens/adminstrator_home_screen/controller/administratior_controller.dart';
import 'package:tractivity_app/view/screens/home_screen/homepage_drawer.dart';
import 'package:tractivity_app/view/screens/organizer_home_screen/organizer_controller/organizer_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';



class AdminstratorHomeScreen extends StatefulWidget {
  const AdminstratorHomeScreen({super.key});

  @override
  State<AdminstratorHomeScreen> createState() => _AdminstratorHomeScreenState();
}

class _AdminstratorHomeScreenState extends State<AdminstratorHomeScreen> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final OrganizerController organizerController = Get.find<OrganizerController>();

  final storage = GetStorage();

  final administratorController = Get.put(AdministratiorController());

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){

      final isTablet = constraints.maxWidth > 600;

      return Scaffold(
        drawer: HomeSideDrawer(),
          appBar: AppBar(
            leading: Builder(builder: (context) {
              return IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: Icon(
                      Icons.menu,
                      color: AppColors.primary,
                      size: isTablet?28.w:24.w
                  ));
            }),
            title: Text(
              administratorController.adminstratior_currentIndex.value==0? "Create Organization":"Create Mission",
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),

        body: SingleChildScrollView(
          child: Obx(
                  () {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [

                      ///=============== Recemt Events Tab Bar ===============

                      const SizedBox(height: 20,),

                      CustomTabSingleText(
                          fontSize: isTablet?24:16,
                          tabs: administratorController.adminstratiorNameList,
                          selectedIndex: administratorController.adminstratior_currentIndex.value,
                          onTabSelected: (value) {
                            administratorController.adminstratior_currentIndex.value = value;
                           setState(() {});
                          },
                          selectedColor: AppColors.primary,
                          unselectedColor: AppColors.grey_1
                      ),

                      const SizedBox(height: 20,),

                      ///============ show Organization List ========
                      if(administratorController.adminstratior_currentIndex.value==0)
                        Column(
                            children: List.generate(6, (index) {
                              return InkWell(
                                onTap: (){

                                  Get.toNamed(AppRoutes.adminstratorOrganizationDetailsScreen);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height:isTablet?140.h: 140.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.grey_3.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    padding: EdgeInsets.only(top: 12),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [

                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [

                                            Padding(
                                              padding: const EdgeInsets.only(left: 8,right: 8),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [


                                                  CustomText(
                                                    text: "${index+1}.Donation Administrator",
                                                    fontSize: 16,
                                                    color: AppColors.black_80,
                                                    fontWeight: FontWeight.w600,
                                                  ),

                                                  CustomText(
                                                    text: "22-12-2025",
                                                    fontSize: 12,
                                                    color: AppColors.black_80,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ],
                                              ),
                                            ),

                                            SizedBox(
                                              height: 6.h,
                                            ),

                                            Padding(
                                              padding: const EdgeInsets.only(left: 8,right: 8),
                                              child: CustomText(
                                                text: "Empowering communities  worldwide  through education, healthcare,  and sustainable development initiatives.",
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

                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [


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

                                                            const CustomText(
                                                              text: "Create Mission",
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
                                                                            color: AppColors.grey_3.withOpacity(0.5),
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
                                                                          fontWeight: FontWeight.w500,
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
                                                                                          height:isTablet?130.h: 100.h,
                                                                                          decoration: BoxDecoration(
                                                                                            color: AppColors.grey_5.withOpacity(0.5),
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
                                                                                                        text: "Jamal",
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
                                                                                                        value: administratorController.organizationIdList.contains(index.toString()),
                                                                                                        onChanged: (bool? value) {

                                                                                                          administratorController.selectedOranization.value = value!;

                                                                                                          if(administratorController.selectedOranization.value){

                                                                                                            administratorController.organizationIdList.add(index.toString());
                                                                                                          }else{
                                                                                                            administratorController.organizationIdList.remove(index.toString());
                                                                                                          }

                                                                                                        },
                                                                                                      ),

                                                                                                    ],
                                                                                                  ),

                                                                                                ],
                                                                                              ),

                                                                                              const SizedBox(
                                                                                                height: 4,
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

                                                                      const SizedBox(
                                                                        height: 12,
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
                                                                          title: "create",
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
                                                  title: "Create Mission",
                                                  width: 120.w,
                                                  height: 32.h,
                                                  textColor: AppColors.black,
                                                  fillColor: AppColors.primary,
                                                  fontSize: 12,
                                                ),

                                                SizedBox(
                                                  width: 8.h,
                                                ),

                                                CustomButton(
                                                  onTap: () {

                                                    showDialog(
                                                      context: context,
                                                      builder: (ctx) => AlertDialog(
                                                        backgroundColor: Colors.white,
                                                        insetPadding: EdgeInsets.all(8),
                                                        contentPadding: EdgeInsets.all(8),
                                                        //   clipBehavior: Clip.antiAliasWithSaveLayer,
                                                        title:Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [

                                                            Align(
                                                              alignment: Alignment.centerLeft,
                                                              child: CustomText(
                                                                text: "Edit Organization",
                                                                fontSize: 24,
                                                                color: AppColors.black,
                                                                fontWeight: FontWeight.w500,
                                                                bottom: 8,
                                                              ),
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
                                                        content: SingleChildScrollView(
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: SizedBox(
                                                              width: MediaQuery.sizeOf(context).width,
                                                              child: Column(
                                                                children: [

                                                                  CustomFormCard(
                                                                    title: "Organization Name",
                                                                    hintText: "Organization Name",
                                                                    hasBackgroundColor: true,
                                                                    fontSize: isTablet?16:16,
                                                                    controller: administratorController.organizationNameController.value,
                                                                  ),

                                                                  CustomFormCard(
                                                                      title: "Description",
                                                                      hintText: "Description",
                                                                      hasBackgroundColor: true,
                                                                      fontSize: isTablet?16:16,
                                                                      controller: administratorController.organizationDescriptionController.value),

                                                                  Obx(()=> Padding(
                                                                    padding: const EdgeInsets.only(left: 12,right: 12),
                                                                    child:administratorController.createOrganLoading.value?CustomLoader(): CustomButton(
                                                                      onTap: () {

                                                                        if(administratorController.organizationDescriptionController.value.text==""){

                                                                          Toast.errorToast("name cannot be empty!");

                                                                        }else if(administratorController.organizationDescriptionController.value.text==""){

                                                                          Toast.errorToast("description cannot be empty!");
                                                                        }else{

                                                                          Navigator.of(context).pop();

                                                                        }
                                                                      },
                                                                      title: "Edit",
                                                                      height: 45.h,
                                                                      textColor: AppColors.black,
                                                                      fillColor: AppColors.primary,
                                                                      fontSize: 12,
                                                                    ),
                                                                  ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );

                                                  },
                                                  title: "Edit",
                                                  width: 70.w,
                                                  height: 32.h,
                                                  textColor: AppColors.black,
                                                  fillColor: AppColors.primary,
                                                  fontSize: 12,
                                                ),

                                                SizedBox(
                                                  width: 8.h,
                                                ),
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
                                                  width: 70.w,
                                                  height: 32.h,
                                                  textColor: AppColors.black,
                                                  fillColor: AppColors.primary,
                                                  fontSize: 12,
                                                ),

                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })),

                      ///============ show Mission List =================
                      if(administratorController.adminstratior_currentIndex.value==1)
                        Column(
                            children: List.generate(3, (index) {
                              return GestureDetector(
                                onTap: (){
                                  Get.toNamed(AppRoutes.adminstratorMissionDetailsScreen);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height:isTablet?140.h: 130.h,
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
                                          padding: const EdgeInsets.only(left: 8,right: 8),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [

                                              SizedBox(
                                                width:isTablet?300.w: 250.w,
                                                child: const CustomText(
                                                  text: "Empowering communities  worldwide  through education, healthcare,  and sustainable development initiatives.",
                                                  fontSize: 12,
                                                  color: AppColors.black_80,
                                                  fontWeight: FontWeight.w400,
                                                  textAlign: TextAlign.start,
                                                  overflow: TextOverflow.clip,
                                                  maxLines: 2,// Add ellipsis at the end if the text overflows.
                                                ),
                                              ),


                                              Column(
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
                                                    height:isTablet?12.h: 8.h,
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
                                                                            color: AppColors.grey_3.withOpacity(0.5),
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
                                                                                            height:isTablet?130.h: 100.h,
                                                                                            decoration: BoxDecoration(
                                                                                              color: AppColors.grey_5.withOpacity(0.5),
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
                                                                                                          text: "Hasan",
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
                                                                                                          value: administratorController.organizationIdList.contains(index.toString()),
                                                                                                          onChanged: (bool? value) {

                                                                                                            administratorController.selectedOranization.value = value!;

                                                                                                            if(administratorController.selectedOranization.value){

                                                                                                              administratorController.organizationIdList.add(index.toString());
                                                                                                            }else{
                                                                                                              administratorController.organizationIdList.remove(index.toString());
                                                                                                            }
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
                );
              }
          ),
        ),
        bottomNavigationBar:  Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            if(administratorController.adminstratior_currentIndex.value==0)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  onTap: () {

                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        backgroundColor: Colors.white,
                        insetPadding: EdgeInsets.all(8),
                        contentPadding: EdgeInsets.all(8),
                        //   clipBehavior: Clip.antiAliasWithSaveLayer,
                        title:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Align(
                              alignment: Alignment.centerLeft,
                              child: CustomText(
                                text: "Create Organization",
                                fontSize: 24,
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                bottom: 8,
                              ),
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
                        content: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              child: Column(
                                children: [

                                  CustomFormCard(
                                    title: "Organization Name",
                                    hintText: "Organization Name",
                                    hasBackgroundColor: true,
                                    fontSize: isTablet?16:16,
                                    controller: administratorController.organizationNameController.value,
                                  ),

                                  CustomFormCard(
                                      title: "Description",
                                      hintText: "Description",
                                      hasBackgroundColor: true,
                                      fontSize: isTablet?16:16,
                                      controller: administratorController.organizationDescriptionController.value),

                                  Obx(()=> Padding(
                                    padding: const EdgeInsets.only(left: 12,right: 12),
                                    child:administratorController.createOrganLoading.value?CustomLoader(): CustomButton(
                                      onTap: () {

                                        if(administratorController.organizationDescriptionController.value.text==""){

                                          Toast.errorToast("name cannot be empty!");

                                        }else if(administratorController.organizationDescriptionController.value.text==""){

                                          Toast.errorToast("description cannot be empty!");
                                        }else{

                                          Navigator.of(context).pop();

                                        }
                                      },
                                      title: "Done",
                                      height: 45.h,
                                      textColor: AppColors.black,
                                      fillColor: AppColors.primary,
                                      fontSize: 12,
                                    ),
                                  ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  title: "Create Organization",
                  height: 45.h,
                  textColor: AppColors.black,
                  fillColor: AppColors.primary,
                  fontSize: 12,
                ),
              ),

            if(administratorController.adminstratior_currentIndex.value==1)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
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

                            const CustomText(
                              text: "Create Mission",
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
                                    administratorController.organizationIdList.value.clear();
                                    administratorController.leaderIdList.value.clear();
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    size: 32,
                                    color: Colors.black,
                                  )),
                            )
                          ],
                        ),
                           content: Obx(() {

                              return SingleChildScrollView(
                                child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width,
                                  ///height: MediaQuery.sizeOf(context).height/1.4,

                                  child: Column(
                                    children: [

                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: CustomText(
                                          text: "Add Organization",
                                          fontSize:isTablet?10.sp: 12.sp,
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w500,
                                          bottom: 4,
                                        ),
                                      ),

                                      Container(
                                          padding: EdgeInsets.only(left: 4.sp,right: 4.sp),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.white,
                                            boxShadow: const [
                                              BoxShadow(color: Colors.black, spreadRadius: 1),
                                            ],
                                          ),
                                          // height: 70.h,
                                          child: ExpansionTile(
                                            title: CustomText(
                                              text: "Select Organization",
                                              fontSize:isTablet? 6.sp:14.sp,
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w500,
                                              textAlign: TextAlign.start,
                                            ),
                                            children: [

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
                                                children:  List.generate(
                                                    3,(index) {

                                                      return Column(
                                                        children: [

                                                          Padding(
                                                            padding: const EdgeInsets.all(4.0),
                                                            child: Container(
                                                              height:isTablet?130.h: 100.h,
                                                              decoration: BoxDecoration(
                                                                color: AppColors.grey_5.withOpacity(0.5),
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
                                                                            text: "Empower Tomorrow",
                                                                            fontSize:isTablet?6.sp: 14.sp,
                                                                            color: AppColors.black_80,
                                                                            fontWeight: FontWeight.w600,
                                                                            overflow: TextOverflow.clip,
                                                                          ),
                                                                        ],
                                                                      ),

                                                                      CustomText(
                                                                        text: "2025-01-20",
                                                                        fontSize: 12,
                                                                        color: AppColors.black_80,
                                                                        fontWeight: FontWeight.w400,
                                                                      ),
                                                                    ],
                                                                  ),

                                                                  const SizedBox(
                                                                    height: 4,
                                                                  ),

                                                                  Padding(
                                                                    padding: const EdgeInsets.only(left: 4,right: 4),
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                              value: administratorController.organizationIdList.contains(index.toString()),
                                                                              onChanged: (bool? value) {

                                                                                administratorController.selectedOranization.value = value!;

                                                                                if(administratorController.selectedOranization.value){

                                                                                  administratorController.organizationIdList.add(index.toString());
                                                                                }else{
                                                                                  administratorController.organizationIdList.remove(index.toString());
                                                                                }

                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
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

                                      const Align(
                                        alignment: Alignment.topLeft,
                                        child: CustomText(
                                          text: "Add Organizer",
                                          fontSize: 14,
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w500,
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
                                                hintText: "Search for Organizer",
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
                                                    3,(index){

                                                  return Column(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(4.0),
                                                        child: Container(
                                                          height:isTablet?130.h: 100.h,
                                                          decoration: BoxDecoration(
                                                            color: AppColors.grey_5.withOpacity(0.5),
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
                                                                        text: "Mehedi Hasan",
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
                                                                        value: administratorController.organizationIdList.contains(index.toString()),
                                                                        onChanged: (bool? value) {

                                                                          administratorController.selectedOranization.value = value!;

                                                                          if(administratorController.selectedOranization.value){

                                                                            administratorController.organizationIdList.add(index.toString());
                                                                          }else{
                                                                            administratorController.organizationIdList.remove(index.toString());
                                                                          }

                                                                        },
                                                                      ),

                                                                    ],
                                                                  ),

                                                                ],
                                                              ),

                                                              const SizedBox(
                                                                height: 4,
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

                                      const SizedBox(
                                        height: 12,
                                      ),

                                      CustomFormCard(
                                          title: "Description",
                                          hintText: "Description",
                                          fontSize: isTablet?16:16,
                                          hasBackgroundColor: true,
                                          controller: administratorController.missionDescriptionController.value),

                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .start,
                                        children: [

                                          CustomText(
                                            text:
                                            "Access mode:",
                                            fontSize:
                                            14,
                                            color: AppColors
                                                .primary,
                                            fontWeight:
                                            FontWeight
                                                .w600,
                                          ),

                                          Radio<bool>(
                                            value:
                                            false, // Value for "No"
                                            fillColor:
                                            WidgetStateColor.resolveWith((states) =>
                                            AppColors.primary),
                                            groupValue: administratorController
                                                .missionStatues
                                                .value,
                                            onChanged:
                                                (bool?
                                            value) {
                                                  administratorController
                                                  .missionStatues
                                                  .value = value!;


                                            },
                                          ),
                                          const CustomText(
                                            text:
                                            "private",
                                            fontSize:
                                            14,
                                            color: AppColors
                                                .black,
                                            fontWeight:
                                            FontWeight
                                                .w600,
                                          ),
                                          Radio<bool>(
                                            value:
                                            true, // Value for "Yes"
                                            fillColor:
                                            WidgetStateColor.resolveWith((states) =>
                                            AppColors.primary),
                                            groupValue: administratorController
                                                .missionStatues
                                                .value,
                                            onChanged:(bool? value) {

                                                  administratorController
                                                  .missionStatues
                                                  .value = value!;

                                            },
                                          ),

                                          const CustomText(
                                            text:
                                            "public",
                                            fontSize:
                                            14,
                                            color: AppColors
                                                .black,
                                            fontWeight:
                                            FontWeight
                                                .w600,
                                          ),
                                        ],
                                      ),

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
                                          title: "Create",
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
                  title: "Create Mission",
                  height: 45.h,
                  textColor: AppColors.black,
                  fillColor: AppColors.primary,
                  fontSize: 12,
                ),
              ),

            /// AdminstratorNavbar(currentIndex: 1,)
          ],
        ),
      );
    });
  }
}
