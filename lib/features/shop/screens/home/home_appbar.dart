//File Created on 26-05-2024 10:20PM


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimart/common/widgets/appbar/appbar.dart';
import 'package:unimart/common/widgets/loaders/shimmer.dart';
import 'package:unimart/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:unimart/features/personalization/controllers/user_controller.dart';
import 'package:unimart/utils/constants/colors.dart';
import 'package:unimart/utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
    
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(TTexts.homeAppbarTitle,style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey)),
        Obx(() { 
          if(controller.profileLoading.value){
            ///Display a shimer loader while user profile is being loaded
            return const TShimmerEffect(width: 80, height: 15);
          }
          else {
            return Text(controller.user.value.fullName,style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white));
          }
          },
          ),
    
      ],
    ),
    actions: const [ 
      //  TCartCounterIcon(onPressed: () {},iconColor: TColors.white,)
        TCartCounterIcon(iconColor : TColors.white, counterBgColor : TColors.black,counterTextColor : TColors.white),
    ],
    );
  }
}