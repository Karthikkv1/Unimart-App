// File created on 24-05-2024  11:27AM    

// import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import 'package:unimart/features/authentication/screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  //Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  
  get deviceStorage => null;


  //Update current index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index ; //changed on 24-05-2024 3:56PM

  //Jump to the specific dot selected page.
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

 // Update Current index and jump to next page
  void nextPage() {
    if(currentPageIndex.value == 2){
      final storage = GetStorage();

      if(kDebugMode){
      print('========Get Storage next button===============');
      print(storage.read("IsFirstTime"));

      }
      storage.writeIfNull('IsFirstTime',false);

      if(kDebugMode){
      print('========Get Storage ===============');
      print(storage.read("IsFirstTime"));

      }


     Get.offAll(const LoginScreen());
    }
    else{
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // Update Current index and jump to the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}