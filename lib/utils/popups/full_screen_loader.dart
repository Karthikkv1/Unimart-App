import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimart/common/widgets/loaders/animation_loader.dart';
import 'package:unimart/utils/constants/colors.dart';
import 'package:unimart/utils/helpers/helper_functions.dart';

///File Created on 10-06-2024 6:38PM

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation){
    showDialog(

      context: Get.overlayContext!,
      barrierDismissible: false,

      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!) ? TColors.dark : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              TAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
        ),
      );
  }

  //Stop the currently open loading dialog
  //This method doesnot return anything

  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
  
}