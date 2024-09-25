import 'package:flutter/material.dart';
import 'package:unimart/common/widgets/appbar/appbar.dart';
import 'package:unimart/common/widgets/brands/brand_card.dart';
import 'package:unimart/common/widgets/products/sortable/sortable_products.dart';
import 'package:unimart/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:unimart/features/shop/controllers/product/brand_controller.dart';
import 'package:unimart/features/shop/models/brand_model.dart';
import 'package:unimart/utils/constants/sizes.dart';
import 'package:unimart/utils/helpers/cloud_helper_functions.dart';

///File Created on 06-06-2024 1:02PM

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {

   final  controller = BrandController.instance;

    return  Scaffold(
      appBar: TAppBar(title: Text(brand.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              
              ///Brand Detail
              TBrandCard(showBorder: true, brand: brand),
              const SizedBox(height: TSizes.spaceBtwSections),

             FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id),
                builder: (context, snapshot) {

                  ///Handle Loader, No Record, OR Error Message
                  
                  const loader = TVerticalProductShimmer();
                  final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if(widget != null) return widget;


                  ///Record Found!
                  final brandProducts = snapshot.data!;
                  return  TSortableProducts(products: brandProducts);
                }
              ),
              

             

            ],

          ),
          
          ),
      ),
    );
  }
}


