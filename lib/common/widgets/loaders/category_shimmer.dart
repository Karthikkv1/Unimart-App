import 'package:flutter/cupertino.dart';
import 'package:unimart/common/widgets/loaders/shimmer.dart';
import 'package:unimart/utils/constants/sizes.dart';

///File Created on 17-06-2024 10:36AM

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer ({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;
  
  @override  
  Widget build(BuildContext context){
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: TSizes.spaceBtwItems),
        itemBuilder: (_, __){
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //Image
              TShimmerEffect(width: 55, height: 55,radius: 55),
              SizedBox(height: TSizes.spaceBtwItems / 2),

              ///Text
              TShimmerEffect(width: 55, height: 8)
            ],
          );
        },
      ),
    );
  }
}