import 'package:flutter/material.dart';
import 'package:unimart/common/widgets/common_widgets/Images/t_circular_image.dart';
import 'package:unimart/utils/constants/colors.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

///File created on 27-05-2024 10:11PM



class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key, required this.image, required this.title,  this.textColor = TColors.white, this.backgroundColor, this.onTap,
    this.isNetworkImage = true,
    // this.backgroundColor =TColors.white
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            ///Circular Icon
            TCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: TSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.dark,
            ),
            ///Text
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            SizedBox(width: 55, child: Text(title,style: Theme.of(context).textTheme.labelMedium!.apply(color:textColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            ),
            ),
        
          ],
          ),
      ),
    );
  }
}





