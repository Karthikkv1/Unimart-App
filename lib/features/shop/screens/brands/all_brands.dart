import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimart/common/widgets/appbar/appbar.dart';
import 'package:unimart/common/widgets/brands/brand_card.dart';
import 'package:unimart/common/widgets/common_widgets/layouts/grid_layout.dart';
import 'package:unimart/common/widgets/common_widgets/texts/section_heading.dart';
import 'package:unimart/common/widgets/shimmers/brands_shimmer.dart';
import 'package:unimart/features/shop/controllers/product/brand_controller.dart';
import 'package:unimart/features/shop/models/brand_model.dart';
// import 'package:unimart/common/widgets/products/sortable/sortable_products.dart';
import 'package:unimart/features/shop/screens/brands/brand_products.dart';

import 'package:unimart/utils/constants/sizes.dart';

///File Created on 06-06-2024 12:22PM

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final brandController = BrandController.instance;


    return  Scaffold(
      appBar: const TAppBar(title: Text('Brand'),showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [

              ///Heading
              const TSectionHeading(title: 'Brands',showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Brands
          
                    Obx(
                      (){

                       if(brandController.isLoading.value) return const TBrandsShimmer();

                       if(brandController.allBrands.isEmpty){
                        return Center(
                          child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white))
                        );
                       }

                       return  TGridLayout(
                        itemCount: brandController.allBrands.length, 
                        mainAxisExtent: 80, 
                        itemBuilder: (_, index)
                      {
                        final brand = brandController.allBrands[index];
                        return   TBrandCard(showBorder:true, brand: brand,
                        onTap: () => Get.to(() =>  BrandProducts(brand: brand))); 
                            
                      },
                      );
                      }, 
                    ),

              
            ],
          ),
          
          ),
      ),
    );
  }
}