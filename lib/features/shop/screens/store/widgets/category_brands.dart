//File Created on 27-06-2024 9:20PM

import 'package:flutter/material.dart';
import 'package:unimart/common/widgets/brands/brand_show_case.dart';
import 'package:unimart/common/widgets/shimmers/boxes_shimmer.dart';
import 'package:unimart/common/widgets/shimmers/list_tile_shimmer.dart';
import 'package:unimart/features/shop/controllers/product/brand_controller.dart';
import 'package:unimart/features/shop/models/category_model.dart';
import 'package:unimart/utils/constants/image_strings.dart';
import 'package:unimart/utils/constants/sizes.dart';
import 'package:unimart/utils/helpers/cloud_helper_functions.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override  
  Widget build(BuildContext context){
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {

        ///Handle Loader, No Record, Or Error Message
        
        const loader = Column(
          children: [
            TListTileShimmer(),
            SizedBox(height: TSizes.spaceBtwItems),
            TBoxesShimmer(),
            SizedBox(height: TSizes.spaceBtwItems)

          ],
        );

        final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
        if(widget != null) return widget;

        //Record Found!
        final brands = snapshot.data!;

        return ListView.builder(
          shrinkWrap : true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (_, index) {
            final brand = brands[index];
            return FutureBuilder(
              future: controller.getBrandProducts(brandId: brand.id, limit: 3),
              builder: (context, snapshot) {


                //Handle Loader,No Record,OR Error Message
                final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                if(widget != null) return widget;

                //Record Found
                final products = snapshot.data!;




                return TBrandShowcase(brand: brand, images: products.map((e) => e.thumbnail).toList());
              }
            );
          },
        );

       
      }
    );
  }
}