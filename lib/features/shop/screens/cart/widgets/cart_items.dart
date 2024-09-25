import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:unimart/common/widgets/products/cart/add_remove_button.dart';
import 'package:unimart/common/widgets/products/cart/cart_item.dart';
import 'package:unimart/common/widgets/products/product_cards/product_price.dart';
import 'package:unimart/features/shop/controllers/product/cart_controller.dart';
import 'package:unimart/utils/constants/sizes.dart';

///File Created on 02-06-2024 8:53AM


class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,

    });

  final bool showAddRemoveButtons;  

  @override
  Widget build(BuildContext context) {

    final cartController = CartController.instance;


    return  Obx(
      () => ListView.separated( 
            
            shrinkWrap: true,
            
            separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections), 
            itemCount:cartController.cartItems.length,
            // scrollDirection: Axis.horizontal,
            itemBuilder:(_, index) => Obx( ()
             { 
              final item = cartController.cartItems[index];


              return Column(
                children: [
                    
                ///Cart Item  
                 TCartItem(cartItem: item),
                if(showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems),
                      
                /// Add Remove Button Row with Total Price
                if(showAddRemoveButtons)
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        //Extra Space
                        const SizedBox(width: 70),
                      
                        //Add Remove Button
                        TProductQuantityWithAddRemove(
                        quantity: item.quantity,
                        add: () => cartController.addOneToCart(item),
                        remove: () => cartController.removeOneFromCart(item),
                        ),
                      ],
                         ),
                     
                      
               ///Product Total Price
                TProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                  ],
                ),
                ],
                      
              ); },
            )
            ),
    );
  }
}