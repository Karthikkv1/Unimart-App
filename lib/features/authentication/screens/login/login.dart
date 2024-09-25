// File created on 24-05-2024 7:55PM

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimart/common/styles/spacing_styles.dart';

// import 'package:unimart/utils/constants/sizes.dart';

import '../../../../utils//constants/sizes.dart';
import '../../../../utils//constants/text_strings.dart';
// import '../../../../utils//helpers/helper_functions.dart';


import 'package:unimart/features/authentication/screens/login/widgets/login_header.dart';
import 'package:unimart/features/authentication/screens/login/widgets/login_form.dart';
import 'package:unimart/common/widgets/login_signup/form_divider.dart';
import 'package:unimart/common/widgets/login_signup/social_buttons.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);

    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //Logo , Title and sub title
              const TLoginHeader(),

              //Form
              const  TLoginForm(),

              ///Divider
              TFormDivider(dividerText:TTexts.orSignInWith.capitalize!),

              const SizedBox(width: TSizes.spaceBtwSections),

              ///Footer
              const TSocialButtons()
            ],
          ),
        
        ),
      ),

    );
  }
}
