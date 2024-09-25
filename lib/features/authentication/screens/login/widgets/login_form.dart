// File Created on 25-05-2024 1:51PM

import 'package:flutter/material.dart';
import 'package:unimart/features/authentication/controllers.onboarding/login/login_controller.dart';
import 'package:unimart/utils/constants/sizes.dart';
import 'package:unimart/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart'; 
import 'package:get/get.dart';
import 'package:unimart/utils/validators/validation.dart';




import '../../../../../features/authentication/screens/login/widgets/signup/signup.dart';

import '../../../../../features/authentication/screens/password_configuration/forget_password.dart'; //26-05-2024 10:00AM

import 'package:unimart/navigation_menu.dart';


class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController()); //15-06-2024 9:02AM

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      
      child: Column(
      children: [
        ///Email
        TextFormField(
          controller: controller.email,
          validator: (value) => TValidator.validateEmail(value),
          decoration:const InputDecoration(
            prefixIcon: Icon(Iconsax.direct_right),
            labelText: TTexts.email
          ),
        ),
    
        const SizedBox(height: TSizes.spaceBtwInputFields),
    
        ///Password
        // TextFormField(
        //   controller: controller.password,
        //   validator: (value) => TValidator.validateEmptyText('Password',value),
        //   decoration:const InputDecoration(
        //     prefixIcon: Icon(Iconsax.password_check),
        //     labelText: TTexts.password,
        //     suffixIcon: Icon(Iconsax.eye_slash),
        //   ),
        // ),

         ///Password
          Obx(
            () =>
            TextFormField(
              validator: (value) => TValidator.validatePassword(value),
              controller: controller.password,
              obscureText: controller.hidePassword.value, //13-06-2024 3:21PM 
              
              decoration:  InputDecoration(
                labelText: TTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                  icon:  Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                ),
                
              ),
            ),
          ), 
    
        const SizedBox(height: TSizes.spaceBtwInputFields / 2),
    
        /// Remember Me and Forget Password
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ///Rember Me
            Row(
              children: [
                Obx(() => Checkbox(value:controller.rememberMe.value, onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value)),
                const Text(TTexts.rememberMe),
              ],
            ),
      
            ///Forget Password
            TextButton(onPressed: () => Get.to(() => const ForgetPassword()), child: const Text(TTexts.forgetPassword)),
          ],
        ),
    
        const SizedBox(height: TSizes.spaceBtwSections),
    
        ///Sign In Button
        SizedBox(width: double.infinity,child: ElevatedButton(onPressed: () => controller.emailAndPasswordSignIn(), child: const Text(TTexts.signIn))),
        const SizedBox(height: TSizes.spaceBtwItems),
       
    
        ///Create Account Button
        SizedBox(width: double.infinity,child:OutlinedButton(onPressed: () => Get.to(() => const SignupScreen()), child: const Text(TTexts.createAccount))),
        // const SizedBox(height: TSizes.spaceBtwSections),
        
    
    
      ],
    
    ),
    ),
    );
  }
}
