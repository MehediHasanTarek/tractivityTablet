import 'package:get/get.dart';
import 'package:tractivity_app/utils/app_strings/app_strings.dart';

class EventsController extends GetxController{

  RxInt profile_currentIndex = 0.obs;

  RxInt currentIndex = 0.obs;

  RxList<String> nameList = [
    AppStrings.events,
    AppStrings.profile,
  ].obs;

  RxList<String> joinEvenNameList = [
    AppStrings.inviteEvent,
    AppStrings.eventListText,
  ].obs;


  final List<String> friendList = [
   AppStrings.seeAllFriends,
   AppStrings.inviteFriends,
   AppStrings.request,
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    currentIndex = 0.obs;
  }
}