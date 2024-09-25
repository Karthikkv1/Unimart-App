import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:unimart/data/repositories/authentication/authentication_repository.dart';
import 'package:unimart/data/services/Network/network_manager.dart';
import 'package:unimart/features/personalization/controllers/user_controller.dart';
import 'package:unimart/utils/constants/image_strings.dart';
import 'package:unimart/utils/popups/full_screen_loader.dart';
import 'package:unimart/utils/popups/loaders.dart';

/// File created on 14-06-2024 10:49PM

class LoginController extends GetxController {

 //variables
 final rememberMe = false.obs;
 final hidePassword = true.obs;
 final localStorage = GetStorage();
 final email = TextEditingController();
 final password = TextEditingController();
 GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
 final userController = Get.put(UserController());

 @override  
 void onInit(){
  //To store password and email locally after successful login
  email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
  password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';

  super.onInit();
 }

 ///Email and Password Signin
  Future<void> emailAndPasswordSignIn() async {
    try{
      //Start Loading
      TFullScreenLoader.openLoadingDialog('Loading you in ...', TImages.docerAnimation);

       //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
         TFullScreenLoader.stopLoading();
         return;
      }
      
      ///Form Validation
      if(!loginFormKey.currentState!.validate()) {
         TFullScreenLoader.stopLoading();
         return;
      }

      ///Save Data if Remember Me is Selected
      if(rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL',email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //Login user using Email and Password Authentication
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      ///Remove Loader
       TFullScreenLoader.stopLoading();

      ///Redirect
      AuthenticationRepository.instance.screenRedirect(); 
    }
    catch(e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }


  ///Google SignIn Authentication
   Future<void> googleSignIn() async {
    try {

    //Start Loading
    TFullScreenLoader.openLoadingDialog('Loading you in ...', TImages.docerAnimation);

    //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
         TFullScreenLoader.stopLoading();
         return;
      }

      //Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      ///Save user Records
      await userController.saveUserRecord(userCredentials);

      ///Remove Loader
      TFullScreenLoader.stopLoading();

      ///Redirect
      AuthenticationRepository.instance.screenRedirect();
      

      
    }
    catch (e) {

      ///Remove Loader
      TFullScreenLoader.stopLoading();
      
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }

   }
}
