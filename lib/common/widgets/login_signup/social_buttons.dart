//File Created on 25-05-2024 2:10PM

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimart/features/authentication/controllers.onboarding/login/login_controller.dart';

import 'package:unimart/utils/constants/colors.dart';
import 'package:unimart/utils/constants/image_strings.dart';
import 'package:unimart/utils/constants/sizes.dart';



class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
              width: TSizes.iconMd,
              height: TSizes.iconMd,
              image: AssetImage(TImages.google),
            ),
    
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
    
        Container(
          decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: (){},
            icon: const Image(
              width: TSizes.iconMd,
              height: TSizes.iconMd,
              image: AssetImage(TImages.facebook),
            ),
    
          ),
        ),
      ],
    );
  }
}


