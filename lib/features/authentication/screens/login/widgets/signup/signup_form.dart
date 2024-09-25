//File Created on 25-05-2024 8:56PM

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimart/features/authentication/controllers.onboarding/signup/signup_controller.dart';
// import 'package:unimart/features/authentication/screens/login/widgets/signup/widgets/verify_email.dart';
import 'package:unimart/utils/constants/sizes.dart';
import 'package:unimart/utils/constants/text_strings.dart';
import 'package:get/get.dart';
// import 'package:unimart/utils/constants/colors.dart';

// import 'package:unimart/utils/helpers/helper_functions.dart';


import 'package:unimart/features/authentication/screens/login/widgets/terms_condition_checkbox.dart';
import 'package:unimart/utils/validators/validation.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final  controller = Get.put(SignupController()); //10-06-2024 6:07PM
      
    return Form(
      key: controller.signupFormKey, //10-06-2024 6:08PM
      child: Column(
      children: [
        // First and Last Name
        Row(children: [
          Expanded(
    
            child: TextFormField(
            controller: controller.firstName, //10-06-2024 6:09PM  
            validator: (value) => TValidator.validateEmptyText('First Name', value),
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.firstName,
              prefixIcon: Icon(Iconsax.user)
    
            ),
          ),
          ),
    
          const SizedBox(width: TSizes.spaceBtwInputFields),
    
          Expanded(
    
            child: TextFormField(
            validator: (value) => TValidator.validateEmptyText('Last Name', value),  
            controller: controller.lastName, //10-06-2024 6:10PM 
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.lastName,
              prefixIcon: Icon(Iconsax.user)
    
            ),
          ),
          ),
    
          
     
    
          
        ],
        ),
    
        const SizedBox(height: TSizes.spaceBtwInputFields),
    
        // User Name
        TextFormField(
            validator: (value) => TValidator.validateEmptyText('User Name', value),
            controller: controller.username,
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.username,
              prefixIcon: Icon(Iconsax.user_edit)
    
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields),
    
        ///Email
        TextFormField(
           validator: (value) => TValidator.validateEmail(value),
           controller: controller.email,
            
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct)
    
            ),
          ), 
    
          const SizedBox(height: TSizes.spaceBtwInputFields), 
    
        ///Phone Number
          TextFormField(
            validator: (value) => TValidator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
            decoration: const InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call)
    
            ),
          ), 
    
          const SizedBox(height: TSizes.spaceBtwInputFields),   
    
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
    
        const SizedBox(height: TSizes.spaceBtwSections), 
    
        ///Terms and Conditions Checkbox
        const TTermsAndConditionCheckbox(),
    
        const SizedBox(height: TSizes.spaceBtwSections),
    
        ///Sign Up Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
          onPressed: () => controller.signup(), //10-06-2024 6:30PM
           child: const Text(TTexts.createAccount) ,
        ),
        )  
    
       
    
      ],
    ), 
    );
  }
}

