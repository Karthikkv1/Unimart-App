import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:unimart/common/widgets/brands/brand_show_case.dart';
import 'package:unimart/common/widgets/common_widgets/layouts/grid_layout.dart';
import 'package:unimart/common/widgets/common_widgets/texts/section_heading.dart';
import 'package:unimart/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:unimart/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:unimart/features/shop/controllers/category_controller.dart';
import 'package:unimart/features/shop/models/category_model.dart';
import 'package:unimart/features/shop/models/product_model.dart';
import 'package:unimart/features/shop/screens/all_products/all_products.dart';
import 'package:unimart/features/shop/screens/store/widgets/category_brands.dart';
// import 'package:unimart/utils/constants/image_strings.dart';
import 'package:unimart/utils/constants/sizes.dart';
import 'package:unimart/utils/helpers/cloud_helper_functions.dart';

///File Created on 30-05-2024 8:54PM


class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return  ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children:[ Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
      
                  ///Brands
                  CategoryBrands(category: category),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  
                  ///Products
                  FutureBuilder(
                    future: controller.getCategoryProducts(categoryId: category.id),
                    builder: (context, snapshot) {

                      //Helper Function: Handle Loader,No Record,OR Error Message
                      final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: const TVerticalProductShimmer());
                      if(response != null) return response;

                      //Record Found!
                      final products = snapshot.data!;


                      return Column(
                        children: [
                          TSectionHeading(title: 'You might like',
                           onPressed:() => Get.to(AllProducts(
                            title: category.name,
                            futureMethod: controller.getCategoryProducts(categoryId: category.id, limit: -1),
                            )) ),
                          const SizedBox(height: TSizes.spaceBtwItems),
                            
                          TGridLayout(itemCount: products.length, itemBuilder: (_, index) => TProductCardVertical(product: products[index])), ///Edited on 19-06-2024 8:06PM
                        ],
                      );
                    }
                  ),
                  
                  // const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
              ),
      ]
    );
  }
}