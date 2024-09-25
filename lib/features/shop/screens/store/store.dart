//File created on 29-05-2024  9:40PM

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimart/common/widgets/appbar/appbar.dart';
import 'package:unimart/common/widgets/appbar/tabbar.dart';
import 'package:unimart/common/widgets/brands/brand_card.dart';
// import 'package:unimart/common/widgets/brands/brand_show_case.dart';
// import 'package:unimart/common/widgets/common_widgets/Images/t_circular_image.dart';
import 'package:unimart/common/widgets/common_widgets/layouts/grid_layout.dart';
import 'package:unimart/common/widgets/common_widgets/texts/section_heading.dart';
// import 'package:unimart/common/widgets/custom_shapes/containers/rounded_container.dart';
// import 'package:unimart/common/widgets/common_widgets/texts/t_brand_title_text_with_verified_icon.dart';
// import 'package:unimart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:unimart/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:unimart/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:unimart/common/widgets/shimmers/brands_shimmer.dart';
import 'package:unimart/features/shop/controllers/category_controller.dart';
import 'package:unimart/features/shop/controllers/product/brand_controller.dart';
import 'package:unimart/features/shop/screens/brands/all_brands.dart';
import 'package:unimart/features/shop/screens/brands/brand_products.dart';
// import 'package:unimart/features/shop/screens/store/store_brands.dart'; //26-06-2024 8:20PM
import 'package:unimart/features/shop/screens/store/widgets/category_tab.dart';
import 'package:unimart/utils/constants/colors.dart';
// import 'package:unimart/utils/constants/image_strings.dart';
// import 'package:unimart/utils/constants/enums.dart';
// import 'package:unimart/utils/constants/image_strings.dart';
import 'package:unimart/utils/constants/sizes.dart';
import 'package:unimart/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
      appBar : TAppBar(
        title:Text('Store',style: Theme.of(context).textTheme.headlineMedium),
        actions: const [
          // TCartCounterIcon(onPressed: (){}, iconColor: null), commented on 06-07-2024 6:15AM
          TCartCounterIcon( iconColor: null),
        ],
      ),
      
      body: NestedScrollView(
        headerSliverBuilder:(_, innerBoxIsScrolled){
          return  [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black  : TColors.white,
              expandedHeight: 440,
      
              flexibleSpace: Padding(
                padding:const EdgeInsets.all(TSizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children:  [
                    ///Search bar
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const TSearchContainer(text: 'Search in Store',showBorder: true,showBackground: false, padding: EdgeInsets.zero),
                    const SizedBox(height: TSizes.spaceBtwSections),
      
                    ///Featured Brands
                    TSectionHeading(title: 'Featured Brands',onPressed:  () => Get.to(() => const AllBrandsScreen())), ///06-06-2024 8:22PM
                    const SizedBox(height: TSizes.spaceBtwItems / 1.5),
      
      
                    /// Brands Grid
                    Obx(
                      (){

                       if(brandController.isLoading.value) return const TBrandsShimmer();

                       if(brandController.featuredBrands.isEmpty){
                        return Center(
                          child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white))
                        );
                       }

                       return  TGridLayout(
                        itemCount: brandController.featuredBrands.length, 
                        mainAxisExtent: 80, 
                        itemBuilder: (_, index)
                      {
                        final brand = brandController.featuredBrands[index];
                        return   TBrandCard(showBorder:true, brand:brand,
                        onTap: () => Get.to(() => BrandProducts(brand: brand)),
                        ); 
                            
                      },
                      );
                      }, 
                    ),
      
                   
      
      
                  ],
                ),
                ),
      
              ///Tabs
              bottom :  TTabBar(
                tabs : categories.map((category) => Tab(child: Text(category.name))).toList()

              ),
      
            ),
          ];
        },
      
        ///Body
        body: TabBarView(
        children: categories.map((category) => TCategoryTab(category: category)).toList()
        ),
      ),
      ),
    );
  }
}






