//File created on 26-05-2024 9:57PM

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimart/features/shop/controllers/product/cart_controller.dart';
import 'package:unimart/features/shop/screens/cart/cart.dart';
import 'package:unimart/utils/constants/colors.dart';
import 'package:unimart/utils/helpers/helper_functions.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    // required this.onPressed, 
    required this.iconColor,
    this.counterBgColor,
    this.counterTextColor,

  });

  // final VoidCallback onPressed;
  final Color? counterBgColor , counterTextColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {

    //Get an instance of the CartController
    final controller = Get.put(CartController());

    final dark = THelperFunctions.isDarkMode(context);
    return Stack(
     children: [
        // IconButton(onPressed: onPressed, icon:  Icon(Iconsax.shopping_bag, color: iconColor)),
        IconButton(onPressed: () => Get.to(() => const CartScreen()), icon:  const Icon(Iconsax.shopping_bag)),
        Positioned(
          right: 0,
          child: Container(
           width: 18,
           decoration: BoxDecoration(
             color: TColors.black,
             borderRadius: BorderRadius.circular(100),
           ),
           child:
            Center(
             child: Obx(
               () => Text(
                controller.noOfCartItems.value.toString(),
               style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.white, fontSizeFactor: 0.8),),
             ),
           ),
          ),
        )
     ],
    );
  }
}