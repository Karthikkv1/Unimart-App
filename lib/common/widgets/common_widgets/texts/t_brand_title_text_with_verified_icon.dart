import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimart/common/widgets/common_widgets/texts/t_brand_title_text.dart';
import 'package:unimart/utils/constants/colors.dart';
import 'package:unimart/utils/constants/enums.dart';
import 'package:unimart/utils/constants/sizes.dart';

///File Created on 30-05-2024 11:09AM

class TBrandTitleWithVerifiedIcon extends StatelessWidget {
  const TBrandTitleWithVerifiedIcon({
    super.key,
    this.textColor,
    this.maxLines = 1,
    required this.title,
    this.iconColor = TColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor ;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,

      children : [
        Flexible(
          child: TBrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
       
        const SizedBox(width: TSizes.xs),
       Icon(Iconsax.verify5, color: iconColor, size: TSizes.iconXs),
      ],
    );
  }
}