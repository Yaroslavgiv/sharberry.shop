import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sharberry_shop/features/authentication/screens/login/login.dart';
import 'package:sharberry_shop/features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();

// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // @override
  // void onInit() {}

// Function to Show Relevant Screen
  screenRedirect() async {
    // LocaL Storage
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(
            const OnBoardingScreen(),
          );
  }

  /* ----------------------------------Email & Password sign-in---------------------------*/

  // [EmailAuthentication] - Signin

  // [EmailAuthentication] - Register

  // [ReAuthentication] - ReAuthentication User

  // [EmailAuthentication] - Forget Password

  /* --------------------------------Federated identity & social sign-in-----------------*/

  // [GoogleAuthentication] - Google

  // [FacebookAuthentication] - Facebook

  /* ---------------------------- ./end Federated identity & social sign-in ------------*/

  // [LogoutUser] - Valid for any authentication

  // DELETE User - Remove user Auth and Firestore Account
}
