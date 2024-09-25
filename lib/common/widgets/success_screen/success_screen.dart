//File Created on 25-05-2024 11:26PM

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:unimart/common/styles/spacing_styles.dart';
// import 'package:unimart/utils/constants/image_strings.dart';
import 'package:unimart/utils/constants/sizes.dart';
import 'package:unimart/utils/constants/text_strings.dart';
import 'package:unimart/utils/helpers/helper_functions.dart';

// import 'package:get/get.dart';
// import '../../../features/authentication/screens/login/login.dart'; //26-05-2024 8:53PM

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subtitle , required this.onPressed});

  final String image,title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
        padding: 
        TSpacingStyle.paddingWithAppBarHeight * 2,
        child: Column(children: [

           ///Image
            Lottie.asset(image,width: MediaQuery.of(context).size.width * 0.6), //14-06-2024 7:41PM
            const SizedBox(height: TSizes.spaceBtwSections),
            

            ///Title and SubTitle
            Text(title,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center),
            const SizedBox(height: TSizes.spaceBtwItems),

         
            Text(subtitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center),
            const SizedBox(height: TSizes.spaceBtwSections),

            ///Buttons
            SizedBox(width: double.infinity,child: ElevatedButton(onPressed: onPressed,child: const Text(TTexts.tContinue)),
            ),


        ],),

        ),
      ),
    );
  }
}