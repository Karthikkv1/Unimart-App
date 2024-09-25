//File created on 05-07-2024 4:48PM



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimart/features/shop/controllers/product/cart_controller.dart';
import 'package:unimart/features/shop/models/product_model.dart';
import 'package:unimart/features/shop/screens/Product_details/widgets/product_detail.dart';
import 'package:unimart/utils/constants/colors.dart';
import 'package:unimart/utils/constants/enums.dart';
import 'package:unimart/utils/constants/sizes.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({super.key , required this.product});
   
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return InkWell(
      onTap: () {

        if (product.productType == ProductType.single.toString()){
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
          
        }
        else{
          Get.to(() => ProductDetailScreen(product: product));
          
        }
       
      },
      child: Obx(
       () { 

        final productQuantityInCart = cartController.getProductQuantityInCart(product.id);
        
        
        return  Container(
          decoration: BoxDecoration(
            color: productQuantityInCart > 0 ? TColors.primary : TColors.dark, // Example color
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(TSizes.cardRadiusMd), // Example radius
              bottomRight: Radius.circular(TSizes.productImageRadius), // Example radius
            ),
          ),
          child: SizedBox(
            width:TSizes.iconLg * 1.2, // Example size
            height: TSizes.iconLg * 1.2, // Example size
            child: Center(
              child: productQuantityInCart > 0 ? Text(productQuantityInCart.toString(),style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.white)) :
              const Icon(Iconsax.add,color: TColors.white),
             
             ), // Example icon
          ),
        );
  }),
    );
  }
}
