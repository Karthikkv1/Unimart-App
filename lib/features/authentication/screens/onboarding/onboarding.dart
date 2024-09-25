// File Created on 24-05-2024 11:22AM

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unimart/features/authentication/controllers.onboarding/onboarding_controller.dart';
// import 'package:iconsax/iconsax.dart'; //24-05-2024 3:35PM

// import 'package:unimart/utils/constants/colors.dart';
import 'package:unimart/utils/constants/image_strings.dart';
// import 'package:unimart/utils/constants/sizes.dart';
// import 'package:unimart/utils/constants/sizes.dart';
import 'package:unimart/utils/constants/text_strings.dart';
// import 'package:unimart/utils/device/device_utility.dart';
// import 'package:unimart/utils/device/device_utility.dart';
// import 'package:unimart/utils/helpers/helper_functions.dart';
// import 'package:unimart/utils/device/device_utility.dart';
// import 'package:unimart/utils/helpers/helper_functions.dart';

import '../../../../../features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:unimart/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import '../../../../../features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import '../../../../../features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:get/get.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override 
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return  Scaffold(
      body: Stack(
        children: [
          //Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(image: TImages.onBoardingImage1,title: TTexts.onBoardingTitle1,subTitle: TTexts.onBoardingSubTitle1,
              ),

              OnBoardingPage(image: TImages.onBoardingImage2,title: TTexts.onBoardingTitle2,subTitle: TTexts.onBoardingSubTitle2,
              ),

              OnBoardingPage(image: TImages.onBoardingImage3,title: TTexts.onBoardingTitle3,subTitle: TTexts.onBoardingSubTitle3,
              ),

            ],

          ),



          //Skip button
          const OnBoardingSkip(),

          // Dot Navigation SmoothPageindicator
          const OnboardingDotNavigation(),


          // Circular button
          const OnBoardingNextButton()
        ],
      )
    );
  }
}


//24-05-2024 3:15PM
// class OnboardingDotNavigation extends StatelessWidget {
//   const OnboardingDotNavigation({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);

//     return Positioned(
//     bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,  
//     left: TSizes.defaultSpace,
    
//     child: SmoothPageIndicator(controller: PageController(), 
//     count:3,
//     effect: ExpandingDotsEffect(activeDotColor: dark ? TColors.light: TColors.dark, dotHeight: 6),
//     ),
//     );
//   }
// }

// class OnBoardingSkip extends StatelessWidget {
//   const OnBoardingSkip({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(top:TDeviceUtils.getAppBarHeight(),
//     right: TSizes.defaultSpace, 
//     child: 
//     TextButton(onPressed: (){},
//      child: const Text('skip'),
//      ),
//      );
//   }
// }

// class OnBoardingPage extends StatelessWidget {
//   const OnBoardingPage({
//     super.key,required this.image, required this.title, required this.subTitle,
//   });

//   final String image, title, subTitle ;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//     padding: const EdgeInsets.all(TSizes.defaultSpace),
    
//     child:Column(
//       children: [
        
       
//         Image(
//           width: THelperFunctions.screenWidth() * 0.8,
//           height: THelperFunctions.screenHeight() * 0.6,
//           image:AssetImage(image)
//           ),
    
//         Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,
        
//         ),
    
//         const SizedBox(height: TSizes.spaceBtwItems),
    
//         Text(subTitle, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,
        
//         ),
        
//       ],
//     ),
//               );
//   }
// }

//stl is shortcut to create stateless widget