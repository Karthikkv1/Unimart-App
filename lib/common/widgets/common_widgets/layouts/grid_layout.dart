import 'package:flutter/material.dart';
// import 'package:unimart/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:unimart/utils/constants/sizes.dart';

///File created on 29-05-2024 8:36PM


class TGridLayout extends StatelessWidget {
  const TGridLayout({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.mainAxisExtent = 288,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
     itemCount: itemCount,
     shrinkWrap: true,
     padding: EdgeInsets.zero,
     physics: const NeverScrollableScrollPhysics(),
     gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
     crossAxisCount: 2,
     mainAxisExtent:mainAxisExtent ,

     mainAxisSpacing: TSizes.gridViewSpacing,
     crossAxisSpacing: TSizes.gridViewSpacing,
     
    
    ),
    itemBuilder:itemBuilder,
    );
  }
}

