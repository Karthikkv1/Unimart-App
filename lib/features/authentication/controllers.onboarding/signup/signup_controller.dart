//File Created on 10-06-2024 5:53PM

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimart/data/repositories/authentication/authentication_repository.dart';
import 'package:unimart/data/repositories/user/user_repository.dart';
import 'package:unimart/data/services/Network/network_manager.dart';
import 'package:unimart/features/authentication/screens/login/widgets/signup/widgets/verify_email.dart';
import 'package:unimart/features/personalization/models/user_model.dart';
import 'package:unimart/utils/constants/image_strings.dart';
import 'package:unimart/utils/popups/full_screen_loader.dart';
import 'package:unimart/utils/popups/loaders.dart';

class SignupController extends GetxController {
  
  static SignupController get instance => Get.find();
  // SignupController();

  ///Variables
  final hidePassword = true.obs; //observable for showing/hiding password
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  //SignUp
  void signup() async  {   //Future<void>
    try{

      //Start Loading
      TFullScreenLoader.openLoadingDialog('We are processing your information.....', TImages.docerAnimation);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
         TFullScreenLoader.stopLoading();
         return;
      }
      

      ///Form Validation
      if(!signupFormKey.currentState!.validate()) {
         TFullScreenLoader.stopLoading();
         return;
      }

      //Privacy Policy Check
      if(!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.',
          );
          return;
      }

      //Register user in the Firebase Authentication & Save user data in the Firebase
    final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

     //Save Authenticated user data in the Firebase Firestore
     final newUser = UserModel(
      id: userCredential.user!.uid,
      firstName: firstName.text.trim(),
      lastName: lastName.text.trim(),
      username: username.text.trim(),
      email: email.text.trim(),
      phoneNumber:phoneNumber.text.trim(),
      profilePicture: '',

     );

     final userRepository = Get.put(UserRepository());
    await userRepository.saveUserRecord(newUser);

     TFullScreenLoader.stopLoading();

    //Show Success Messgae
    TLoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created! Verify email to continue.');

    //Move to verify Email Screen
    Get.to(() =>  VerifyEmailScreen(email: email.text.trim()));  //14-06-2024 7:09PM
      

    }
    catch (e) {

      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!',message:e.toString());

    }
    // finally{
    //    ///Remove Loader
    //    TFullScreenLoader.stopLoading();
    // }
  }
}

