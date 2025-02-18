import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tractivity_app/utils/app_strings/app_strings.dart';

class OrganizerController extends GetxController{
  RxInt currentIndex = 0.obs;
  RxList<String> nameList = [

    AppStrings.invitedMission,
    AppStrings.missionList

  ].obs;
  RxList<String> inviteMissionNameList = [
    AppStrings.inviteMission,
    AppStrings.eventList,
  ].obs;


  RxInt adminstratior_currentIndex = 0.obs;

  RxList<String> adminstratiorNameList = [
    "Organization List",
   "Mission List",
  ].obs;

  RxBool missionActiveInactiveStatus = false.obs;

  RxBool missionMarkasActiveStatus = false.obs;


  RxString formattedDate="".obs;

  Rx<TextEditingController> eventSearchDateController = TextEditingController().obs;

  void eventSearchDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime(2007, 12, 31), // Latest selectable date
      firstDate: DateTime(2000), // Earliest selectable date
      lastDate: DateTime(2100),  // Needed for future filtering

    );

    if (pickedDate != null) {
      formattedDate.value = DateFormat('yyyy-MM-dd').format(pickedDate);
      eventSearchDateController.value.text  = formattedDate.value;
    } else {
      formattedDate.value = "Date not selected";
    }
  }

}