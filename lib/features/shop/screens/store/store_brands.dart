//File Created on 30-05-2024 12:12PM


import 'package:flutter/material.dart';
import 'package:unimart/common/widgets/common_widgets/Images/t_circular_image.dart';
import 'package:unimart/common/widgets/common_widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:unimart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:unimart/utils/constants/colors.dart';
import 'package:unimart/utils/constants/enums.dart';
import 'package:unimart/utils/constants/image_strings.dart';
import 'package:unimart/utils/constants/sizes.dart';
import 'package:unimart/utils/helpers/helper_functions.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key, required bool showBorder,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: (){},
    child: TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.sm),
      showBorder: true,
      backgroundColor: Colors.transparent,
      child: Row(
        children: [
    
          ///Icon
          Flexible(
            child: TCircularImage(
              isNetworkImage: false,
              image: TImages.clothIcon,
              backgroundColor: Colors.transparent,
              overlayColor: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
            ),
          ),
    
          const SizedBox(width: TSizes.spaceBtwItems / 2 ),
    
          ///Text
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TBrandTitleWithVerifiedIcon(
                title: 'Nike',brandTextSize: TextSizes.large),
                Text(
                  '256 Products with different choices',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          )
          
        ],
      ),
    ),
      );
  }
}