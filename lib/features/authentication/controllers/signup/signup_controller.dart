import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/loaders/loaders.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import 'network_manager.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //? Variables
  final hidePassword = true.obs; // Observable for hiding password 
  final privacyPolicy = true.obs; // Observable for privacy policy acceptance 
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNamber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // Form key for form validation


  //? SIGNUP
  Future<void> signup() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog('Мы обрабатываем вашу информацию...', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instanse.isConnected();
      if(!isConnected) return;
      

      // Form Validation
      if(!signupFormKey.currentState!.validate()) return;
      // Privacy Policy Check

      // Register user in the Firebase Authentication & Save user data in the Firebase
      
      // Save Authenticated user data in the Firebase Firestore

      // Show Success Message

      // Move to Verify Email Screen

    } catch (e) {
      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // Remove Loader
      TFullScreenLoader.stopLoading();
    }
  }


}