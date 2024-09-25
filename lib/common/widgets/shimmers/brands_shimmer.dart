//File Created on 26-06-2024 4:40PM

import 'package:flutter/material.dart';
import 'package:unimart/common/widgets/common_widgets/layouts/grid_layout.dart';
import 'package:unimart/common/widgets/loaders/shimmer.dart';

class TBrandsShimmer extends StatelessWidget {
  const TBrandsShimmer({super.key, this.itemCount = 4});
  
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (_, __) => const TShimmerEffect(width: 300, height: 80),
    ); // TGridLayout
  }
}
