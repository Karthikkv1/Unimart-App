import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimart/common/widgets/chips/choice_chip.dart';
import 'package:unimart/common/widgets/common_widgets/texts/product_title_text.dart';
import 'package:unimart/common/widgets/common_widgets/texts/section_heading.dart';
import 'package:unimart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:unimart/common/widgets/products/product_cards/product_price.dart';
import 'package:unimart/features/shop/controllers/variation_controller.dart';
import 'package:unimart/features/shop/models/product_model.dart';
import 'package:unimart/utils/constants/colors.dart';
import 'package:unimart/utils/constants/sizes.dart';
import 'package:unimart/utils/helpers/helper_functions.dart';

///File created on 31-05-2024 9:42PM

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key , required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
  final controller = Get.put(VariationController());  
  final dark = THelperFunctions.isDarkMode(context);
    return  Obx(
     () => Column(
        children: [
      
      
          ///Selected Attribute Pricing & Description
          if(controller.selectedVariation.value.id.isNotEmpty)
          TRoundedContainer(
            padding: const EdgeInsets.all(TSizes.md),
            backgroundColor: dark ? TColors.darkGrey : TColors.grey,
            child:  Column(
              children: [
      
                ///Title , Price and Stock Status
               Row(
                children: [
                  const TSectionHeading(title: 'Variation', showActionButton: false),
                  const SizedBox(width: TSizes.spaceBtwItems),
      
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                    Row(
                    children: [
                       const TProductTitleText(title: 'Price : ', smallSize: true),
                      
                      ///Actual Price
                      if (controller.selectedVariation.value.salePrice > 0)
                      Text('\$${controller.selectedVariation.value.price}',style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
      
                      const SizedBox(width: TSizes.spaceBtwItems),
      
      
                      ///Sale Price
                       TProductPriceText(price: controller.getVariationPrice()),
                    ],
                    ),
      
                    ///Stock
                     Row(
                      children: [
                       const TProductTitleText(title: 'Stock : ', smallSize: true),
                       Text(controller.variationStockStatus.value,style: Theme.of(context).textTheme.titleMedium)
                      ],
                      ),
      
                    ],
                  ),
            
      
                  
      
                ],
                ),
      
                ///Variation Description
                TProductTitleText(
                title: controller.selectedVariation.value.description ?? '',
                smallSize: true,
                maxLines: 4,
                ),
      
      
              ],
              ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
      
          ///Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!.map((attribute) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
          TSectionHeading(title: attribute.name ?? '', showActionButton: false),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          Obx
          (
            () => 
           Wrap(
            spacing: 8,
            children: attribute.values!.map((attributeValue) {
            
              final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
              final available = controller.getAttributesAvailabilityInVariation(product.productVariations!,attribute.name!).contains(attributeValue);
            
              return TChoiceChip(text: attributeValue, selected: isSelected, onSelected: available ? (selected){
                if (selected && available ){
                  controller.onAttributeSelected(product, attribute.name ?? '', attributeValue);
                }
              } : null);
              }).toList()),
          ) 
          
          
            ],
          
      
      
          
          )
          ).toList(),
          ),
          
        ],
      ),
    );


      
  }
}


//  Column( 21-06-2024 3:01PM
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//         const TSectionHeading(title: 'Size', showActionButton: false),
//         const SizedBox(height: TSizes.spaceBtwItems / 2),
//         Wrap(
//         spacing: 8,
//         children: [
//         TChoiceChip(text: 'EU 34', selected: true, onSelected: (value){}),
//         TChoiceChip(text: 'EU 36', selected: false, onSelected: (value){}),
//         TChoiceChip(text: 'EU 38', selected: false, onSelected: (value){}),
        
//         ],
//        )

//         ],
//         )
//       ],
//     );
