import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimart/data/repositories/user/user_repository.dart';
import 'package:unimart/data/services/Network/network_manager.dart';
import 'package:unimart/features/personalization/controllers/user_controller.dart';
import 'package:unimart/features/personalization/screens/profile/widgets/profile.dart';
import 'package:unimart/utils/constants/image_strings.dart';
import 'package:unimart/utils/popups/full_screen_loader.dart';
import 'package:unimart/utils/popups/loaders.dart';
// import 'package:unimart/features/personalization/controllers/user_controller.dart';/

///File Created on 16-06-2024 12:28PM

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  ///init user data when Home Screen appears
  @override  
  void onInit(){
    initializeNames();
    super.onInit();
  }

  ///Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {

      //Start Loading
      TFullScreenLoader.openLoadingDialog('We are updating your information.....', TImages.docerAnimation);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
         TFullScreenLoader.stopLoading();
         return;
      }

      ///Form Validation
      if(!updateUserNameFormKey.currentState!.validate()) {
         TFullScreenLoader.stopLoading();
         return;
      }

      ///Update users's first and last name in the Firebase Firestore
      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName':lastName.text.trim()};
      await userRepository.updateSingleField(name);

      ///Update the Rx User Value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      //Remove Loader
      TFullScreenLoader.stopLoading();

      //Show Success Message
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your Name has been updated. ');

      //Move to previous screen
      Get.off(() => const ProfileScreen());


    }
    catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }

  }


 
  }
