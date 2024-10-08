//File Created on 01-06-2024 10:44PM



import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimart/common/widgets/icons/t_circular_icon.dart';
import 'package:unimart/utils/constants/colors.dart';
import 'package:unimart/utils/constants/sizes.dart';
import 'package:unimart/utils/helpers/helper_functions.dart';

class TProductQuantityWithAddRemove extends StatelessWidget {
  const TProductQuantityWithAddRemove({
    super.key, required this.quantity, this.add, this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
  
      
        
        ///Add Remove Button
      return  Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TCircularIcon(
              icon: Iconsax.minus,
              width: 32,
              height: 32,
              size: TSizes.md,
              color: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
              backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
              onPressed: remove,
              
              ),
        
          const SizedBox(width: TSizes.spaceBtwItems),
          Text(quantity.toString(),style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(width: TSizes.spaceBtwItems),
    
          TCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: TColors.white,
          backgroundColor: TColors.primary,
          onPressed: add,
          
          ),
    
        
      ],
    );
  }
}