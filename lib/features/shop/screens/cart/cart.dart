//File Created on 01-06-2024 9:05PM

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
import 'package:unimart/common/widgets/appbar/appbar.dart';
import 'package:unimart/common/widgets/loaders/animation_loader.dart';
import 'package:unimart/features/shop/controllers/product/cart_controller.dart';
// import 'package:unimart/common/widgets/common_widgets/Images/t_rounded_image.dart';
// import 'package:unimart/common/widgets/common_widgets/texts/product_title_text.dart';
// import 'package:unimart/common/widgets/common_widgets/texts/t_brand_title_text_with_verified_icon.dart';
// import 'package:unimart/common/widgets/custom_shapes/containers/circular_container.dart';
// import 'package:unimart/common/widgets/icons/t_circular_icon.dart';
// import 'package:unimart/common/widgets/products/cart/add_remove_button.dart';
// import 'package:unimart/common/widgets/products/cart/cart_item.dart';
import 'package:unimart/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:unimart/features/shop/screens/checkout/widgets/checkout.dart';
import 'package:unimart/navigation_menu.dart';
import 'package:unimart/utils/constants/image_strings.dart';
// import 'package:unimart/common/widgets/products/product_cards/product_price.dart';
// import 'package:unimart/utils/constants/colors.dart';
// import 'package:unimart/utils/constants/image_strings.dart';
import 'package:unimart/utils/constants/sizes.dart';
// import 'package:unimart/utils/helpers/helper_functions.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;



    return  Scaffold(
      appBar: TAppBar(showBackArrow: true,title: Text('Cart',style: Theme.of(context).textTheme.headlineSmall)),
      body: Obx(
        () {

          //Nothing Found widget
          final emptyWidget = TAnimationLoaderWidget(
            text: 'Whoops! Cart is Empty.',
            animation: TImages.cartAnimation,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
             );

             if (controller.cartItems.isEmpty) {
               return emptyWidget;
             } else {
               return const SingleChildScrollView(
                 child: Padding(
                               padding: EdgeInsets.all(TSizes.defaultSpace),
                 
                 ///Items in cart
                           child: TCartItems(),
                 
                               
                               ),
               );
             }


          
        },
      ),

      ///Checkout Button
      bottomNavigationBar: controller.cartItems.isEmpty
      ? const SizedBox()
      :  Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),

        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen()), 
          child:  Obx(() => Text('Checkout \$${controller.totalCartPrice.value}')),
          ),
      ),
    );
  }
}



