import 'package:flutter/material.dart';
import 'package:unimart/common/widgets/common_widgets/Images/t_circular_image.dart';
import 'package:unimart/common/widgets/common_widgets/texts/product_title_text.dart';
import 'package:unimart/common/widgets/common_widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:unimart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:unimart/common/widgets/products/product_cards/product_price.dart';
import 'package:unimart/features/shop/controllers/product_controller.dart';
import 'package:unimart/features/shop/models/product_model.dart';
import 'package:unimart/utils/constants/colors.dart';
import 'package:unimart/utils/constants/enums.dart';
import 'package:unimart/utils/constants/image_strings.dart';
import 'package:unimart/utils/constants/sizes.dart';
import 'package:unimart/utils/helpers/helper_functions.dart';

///File  Created on 31-05-2024 8:05PM

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({
    super.key,
    required this.product
    });

    final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final darkMode = THelperFunctions.isDarkMode(context);
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        ///Price and Sale Price
        Row(
          children: [
            /// Sale Tag
            TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),
                    child: Text('$salePercentage%',style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),

            /// Price
            if(product.productType == ProductType.single.toString() && product.salePrice > 0)
            Text('\$${product.price}',style: Theme.of(context).textTheme.titleSmall!.apply(
              decoration: TextDecoration.lineThrough
            )),

            // const SizedBox(width: TSizes.spaceBtwItems), 
            if(product.productType == ProductType.single.toString() && product.salePrice > 0)
            const SizedBox(width: TSizes.spaceBtwItems), 
             TProductPriceText(price: controller.getProductPrice(product),isLarge: true),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5 ), 

        
        /// Title
         TProductTitleText(title: product.title),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5 ), 

        /// Stack Status
        Row(
          children: [
            const TProductTitleText(title: 'Status'),
            const SizedBox(width: TSizes.spaceBtwItems), 
            Text(controller.getProductStockStatus(product.stock), style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        
        const SizedBox(height: TSizes.spaceBtwItems / 1.5 ), 

        /// Brand
        Row(
          children: [
            TCircularImage(
              image: product.brand != null ? product.brand!.image : '',
              width: 32,
              height: 32,
              overlayColor: darkMode ? TColors.white : TColors.black,
              ),
            TBrandTitleWithVerifiedIcon(title: product.brand != null ? product.brand!.name : '',brandTextSize: TextSizes.medium),
          ],
        ),

      ],
    );
 
  }
}