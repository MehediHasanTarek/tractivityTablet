
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tractivity_app/utils/app_colors/app_colors.dart';
import 'package:tractivity_app/view/components/custom_button/custom_button.dart';
import 'package:tractivity_app/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:tractivity_app/view/components/custom_text/custom_text.dart';
import 'package:tractivity_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:tractivity_app/view/screens/adminstrator_home_screen/controller/administratior_controller.dart';

class JoinOrganizationScreen extends StatefulWidget {
  const JoinOrganizationScreen({super.key});

  @override
  State<JoinOrganizationScreen> createState() => _JoinOrganizationScreenState();
}

class _JoinOrganizationScreenState extends State<JoinOrganizationScreen> {

  final administratorController = Get.put(AdministratiorController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){

      final isTablet = constraints.maxWidth > 600;

      return Scaffold(
          appBar: CustomRoyelAppbar(
            leftIcon: true,
            titleName: "Join Organization",
          ),
          body:Obx(
             () {
              return SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.only(left: 8.sp,right: 8.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // height: 70.h,
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 16.h,
                        ),
                        ///======== Search Bar ==============
                        CustomTextField(
                          hintText: "Search for organization name",
                          fillColor: AppColors.neutral02,
                          suffixIcon: Icon(
                            Icons.search,
                            color: AppColors.black_60,
                          ),
                        ),

                        SizedBox(
                          height: 12.h,
                        ),
                        Column(
                          children:  List.generate(
                              3,(index) {

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
                                                  text: "Empower Tomorrow",
                                                  fontSize:isTablet?6.sp: 14.sp,
                                                  color: AppColors.black_80,
                                                  fontWeight: FontWeight.w600,
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ],
                                            ),

                                            const CustomText(
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
                                                    overflow: TextOverflow.ellipsis,
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
                        ),


                      ],
                    )
                ),
              );
            }
          ),

         bottomNavigationBar:  Column(
           mainAxisSize: MainAxisSize.min,
           children: [
             Padding(
               padding: const EdgeInsets.only(left: 12,right: 12,bottom: 12),
               child: CustomButton(
                 onTap: () {

                 },
                 title: "Join",
                 height: 60.h,
                 textColor: AppColors.black,
                 fillColor: AppColors.primary,
                 fontSize:isTablet?8.sp: 14.sp,
               ),
             )
           ],
         ),
      );
    });
  }
}
