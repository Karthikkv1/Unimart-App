import 'package:flutter/material.dart';
import 'package:unimart/common/widgets/common_widgets/Images/t_circular_image.dart';
import 'package:unimart/common/widgets/common_widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:unimart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:unimart/features/shop/models/brand_model.dart';
import 'package:unimart/utils/constants/colors.dart';
import 'package:unimart/utils/constants/enums.dart';
// import 'package:unimart/utils/constants/image_strings.dart';
import 'package:unimart/utils/constants/sizes.dart';
import 'package:unimart/utils/helpers/helper_functions.dart';

///File Created on 06-06-2024


class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    this.onTap,
    required this.showBorder,
    required this.brand,
    });

    final BrandModel brand; //26-06-2024 8:11PM
    final bool showBorder;
    final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,

      ///Container Design
      child: TRoundedContainer(
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(TSizes.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            ///Icon
            Flexible(
              child: TCircularImage(
                isNetworkImage: true,
                image: brand.image,
                backgroundColor: Colors.transparent,
                overlayColor: isDark ? TColors.white : TColors.black,
              ),
              ),

              const SizedBox(width: TSizes.spaceBtwItems / 2),

              ///Texts 
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     TBrandTitleWithVerifiedIcon(title: brand.name,brandTextSize: TextSizes.large),
                    Text(
                      '${brand.productsCount ?? 0} products',
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