//File Created on 25-05-2024 8:35PM

import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:unimart/data/repositories/authentication/authentication_repository.dart';
// import 'package:unimart/common/widgets/success_screen/success_screen.dart';
import 'package:unimart/features/authentication/controllers.onboarding/signup/verify_email_controller.dart';
import 'package:unimart/features/authentication/screens/login/login.dart';
import 'package:unimart/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

import 'package:unimart/utils/constants/image_strings.dart';
import 'package:unimart/utils/helpers/helper_functions.dart';
import 'package:unimart/utils/constants/text_strings.dart';



class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key,this.email});

  final String? email; //14-06-2024 7:06PM

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(



      appBar: AppBar(
        automaticallyImplyLeading: false, //To -> arrow to be hide
        actions: [
          IconButton(onPressed: () => AuthenticationRepository.instance.logout(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding:const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            ///Image
            Image(image:const AssetImage(TImages.deliveredEmailIllustration), width: THelperFunctions.screenWidth() * 0.6,),
            const SizedBox(height: TSizes.spaceBtwSections),
            

            ///Title and SubTitle
            Text(TTexts.confirmEmail,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(email ?? '',style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(TTexts.confirmEmailSubTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center),
            const SizedBox(height: TSizes.spaceBtwSections),

            ///Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton
              (onPressed: () => controller.checkEmailVerificationStatus(), //14-06-2024 7:56PM
            child: const Text(TTexts.tContinue),
            ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            SizedBox(width: double.infinity,child:TextButton(onPressed: () => controller.sendEmailVerification(), child:const Text(TTexts.resendEmail))),
          ],
        ),),
      ),
    );
  }
}