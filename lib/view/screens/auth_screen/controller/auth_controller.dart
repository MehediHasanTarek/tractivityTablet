import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:tractivity_app/core/app_routes/app_routes.dart';
import 'package:tractivity_app/helper/shared_prefe/shared_prefe.dart';
import 'package:tractivity_app/service/api_check.dart';
import 'package:tractivity_app/service/api_client.dart';
import 'package:tractivity_app/service/api_url.dart';
import 'package:tractivity_app/utils/ToastMsg/toast_message.dart';
import 'package:tractivity_app/utils/app_const/app_const.dart';
import 'package:tractivity_app/utils/app_strings/app_strings.dart';
import 'package:tractivity_app/utils/toast.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {


  RxBool agreeStatue = false.obs;

  RxString checkValueStatues = "".obs;


  ///======================================>> picker Cover photo  <<================================

  final ImagePicker pickerCover = ImagePicker();
  //File? imagePath;
  RxString chooseUserImage = "".obs;

  Future<void> chooseUserPhoto() async {
    try {
      final XFile? pickedFile =
      await pickerCover.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        // Convert XFile to File if needed

        chooseUserImage.value = pickedFile.path; // Ensure the file path is valid
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }


  ///==================== get User Current Location and address ==================

  RxString address = "".obs;

  Position? _currentPosition;

  Future<void> getUserCurrentLocation() async {
    try {

      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition();

      _currentPosition = position;

      locationController.value.text ="${_currentPosition?.latitude},${_currentPosition?.longitude}";


      debugPrint("_currentPosition: ${_currentPosition?.latitude},${_currentPosition?.longitude}");

      List<Placemark> placemarks = await placemarkFromCoordinates(_currentPosition?.latitude??0.0, _currentPosition?.longitude??0.0);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        ///  setState(() { });

        address.value ="${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";

      } else {
        address.value = "No address found.";
      }

    } catch (e) {
      print("Error getting location: $e");
    }
  }

  RxBool volunteer = false.obs;

  RxBool organizer = false.obs;

  RxBool administrator = false.obs;

  RxList<String>rolesList = <String>[].obs;

  RxList<String>cordsList = <String>[].obs;

  ///====================USER REGISTER CONTROLLER==================
  Rx<TextEditingController> fullNameController = TextEditingController().obs;
  Rx<TextEditingController> talentSkillController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;

  ///=====================USER REGISTER METHOD=====================
  RxBool userRegisterLoading = false.obs;

  Future<void> userRegister() async {

    userRegisterLoading.value = true;


    var body = json.encode({
      "fullName": fullNameController.value.text,
      "profession": talentSkillController.value.text,
      "email": emailController.value.text,
      "phone": phoneNumberController.value.text,
      "password": passwordController.value.text,
      "roles":rolesList.value,
      "cords": {
        "lat": _currentPosition?.latitude,
        "lng": _currentPosition?.longitude
      },
      "address": address.value,
      "isSocial": false,
      "fcmToken": null
    });

    var response = await ApiClient.postData(ApiUrl.signUp, body);


    if (response.statusCode == 201) {

      Toast.successToast(response.body['message']);
      Get.toNamed(AppRoutes.loginScreen);

      clearUserRegisterTextFields();
      refresh();
      userRegisterLoading.value = false;

    } else {
      userRegisterLoading.value = false;
      if (response.statusText == ApiClient.somethingWentWrong) {

        Toast.errorToast(AppStrings.checknetworkconnection);

        return;
      } else {

        ApiChecker.checkApi(response);
        userRegisterLoading.value = false;
        refresh();
        return;
      }
    }
  }


  ///=========== CLEAR USER REGITER TEXT FIELDS =============
  clearUserRegisterTextFields() {
    fullNameController.value.clear();
    emailController.value.clear();
    phoneNumberController.value.clear();
    passwordController.value.clear();
    confirmPasswordController.value.clear();
    locationController.value.clear();
  }

  ///======================VALITATION CONTROLLER=====================
  Rx<TextEditingController> otpController = TextEditingController().obs;
  ///=====================VALITATION METHOD=====================

  RxBool otpLoading = false.obs;

  Future<void> otpValidation(String email) async {

    otpLoading.value = true;

    refresh();
    var body = {
      "email": email,
      "otp": otpController.value.text,
    };
    var response = await ApiClient.postData(ApiUrl.otp_verify, jsonEncode(body));
    if (response.statusCode == 200) {
      otpLoading.value = false;
      refresh();

      Toast.successToast(response.body['message']);

      Get.toNamed(AppRoutes.forgotPassword,
          arguments: [
            {
              "email":forgetEmailController.value.text
            }
          ]
      );

    } else {

      if (response.statusText == ApiClient.somethingWentWrong) {

        Toast.errorToast(AppStrings.checknetworkconnection);
        otpLoading.value = false;
        refresh();
        return;

      } else {
        ApiChecker.checkApi(response);
        otpLoading.value = false;
        refresh();
        return;
      }
    }
  }


  RxBool otpResetLoading = false.obs;

  Future<void> otpResetValidation(String email) async {

    otpResetLoading.value = true;

    var body = {
      "email": email,
    };

    var response = await ApiClient.postData(ApiUrl.forget_password, jsonEncode(body));
    if (response.statusCode == 200) {
      otpResetLoading.value = false;
      refresh();

      Toast.successToast(response.body['message']);

      Get.toNamed(AppRoutes.forgotPassword);

    } else {

      if (response.statusText == ApiClient.somethingWentWrong) {

        Toast.errorToast(AppStrings.checknetworkconnection);
        otpResetLoading.value = false;
        refresh();
        return;

      } else {
        ApiChecker.checkApi(response);
        otpResetLoading.value = false;
        refresh();
        return;
      }
    }
  }


  ///====================FORGET PASSWORD CONTROLLER==================
  Rx<TextEditingController> forgetEmailController = TextEditingController().obs;
  ///================= FORGET PASSWORD METHOD================

  RxBool forgetPasswordLoading = false.obs;

  Future<void> forgetPassword() async {

    forgetPasswordLoading.value = true;
    refresh();
    var body = {"email": forgetEmailController.value.text};

    var response = await ApiClient.postData(ApiUrl.forget_password, jsonEncode(body));

    if (response.statusCode == 200) {

      forgetPasswordLoading.value = false;

      refresh();

      Toast.successToast(response.body['message']);

      Get.toNamed(AppRoutes.verificationScreen,arguments: [
        {
          "email":forgetEmailController.value.text
        }
      ]);

    } else {

      if (response.statusText == ApiClient.somethingWentWrong) {

        Toast.errorToast(response.body['message']);

        forgetPasswordLoading.value = false;
        refresh();
        return;
      } else {
        ApiChecker.checkApi(response);
        forgetPasswordLoading.value = false;
        refresh();
        return;
      }
    }
  }

  ///====================RESET PASSWORD CONTROLLER==================
  Rx<TextEditingController> resetNewPasswordController =
      TextEditingController().obs;
  Rx<TextEditingController> resetConfirmPasswordController =
      TextEditingController().obs;

  ///================= RESET PASSWORD METHOD================
  RxBool resetPasswordLoading = false.obs;

  Future<void> restPassword(String email) async {
    resetPasswordLoading.value = true;

    var body = {
      "email": email,
      "newPassword": resetNewPasswordController.value.text,
    };
    var response =
    await ApiClient.postData(ApiUrl.forgotPassword, jsonEncode(body));
    if (response.statusCode == 200) {
      resetPasswordLoading.value = false;
      refresh();

      Toast.successToast("password Reset SuccessFull..");

      Get.toNamed(AppRoutes.loginScreen);

    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {

        Toast.errorToast(AppStrings.checknetworkconnection);

        resetPasswordLoading.value = false;
        refresh();
        return;
      } else {
        ApiChecker.checkApi(response);
        resetPasswordLoading.value = false;
        refresh();
        return;
      }
    }
  }

  ///======================LOGIN CONTROLLER=====================

  Rx<TextEditingController> loginEmailController = TextEditingController(
    text: kDebugMode ? "" : "",
  ).obs;

  Rx<TextEditingController> loginPasswordController = TextEditingController(
    text: kDebugMode ? "" : "",
  ).obs;

  ///=====================LOGIN METHOD=====================
  RxBool loginLoading = false.obs;

  Future<void> userLogin() async {
    loginLoading.value = true;
    refresh();
    var body = {
      "email": loginEmailController.value.text,
      "password": loginPasswordController.value.text,
      "isSocial": false,
      "fcmToken": null
    };
    var response = await ApiClient.postData(ApiUrl.login, jsonEncode(body));
    if (response.statusCode == 200) {
      loginLoading.value = false;
      refresh();
      ///  showCustomSnackBar(response.body['message']!, isError: false);

      SharePrefsHelper.setString(AppConstants.bearerToken, response.body["data"]["accessToken"]);

      SharePrefsHelper.setString(AppConstants.userId, response.body["data"]["_id"]);

      SharePrefsHelper.setString(AppConstants.userEmail, response.body["data"]["email"]);

      Get.toNamed(AppRoutes.homeScreen);

    } else {
      loginLoading.value = false;
      refresh();
      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        return;
      } else {
        ApiChecker.checkApi(response);
        return;
      }
    }
  }


}

class UserModel {
  final String email;
  final String screenName;
  UserModel(this.email, this.screenName);
}
