// File created on 26-05-2024 2:44PM

// import 'dart:ui';

// import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimart/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:unimart/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:unimart/features/shop/controllers/product_controller.dart';
import 'package:unimart/features/shop/screens/all_products/all_products.dart';
// import 'package:unimart/common/widgets/custom_shapes/containers/circular_container.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:unimart/common/widgets/appbar/appbar.dart';
// import 'package:unimart/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:unimart/features/shop/screens/home/home_appbar.dart';
import 'package:unimart/features/shop/screens/home/widgets/home_categories.dart';
import 'package:unimart/features/shop/screens/home/widgets/promo_slider.dart';
// import 'package:unimart/utils/constants/image_strings.dart';
// import 'package:unimart/utils/constants/colors.dart';
// import 'package:unimart/utils/constants/image_strings.dart';
// import 'package:unimart/utils/constants/colors.dart';
// import 'package:unimart/utils/constants/image_strings.dart';
// import 'package:unimart/utils/constants/colors.dart';
import 'package:unimart/utils/constants/sizes.dart';
// import 'package:unimart/utils/helpers/helper_functions.dart';
// import 'package:unimart/utils/device/device_utility.dart';
// import 'package:unimart/utils/helpers/helper_functions.dart';
// import 'package:unimart/common/widgets/appbar/appbar.dart';
// import 'package:unimart/utils/constants/colors.dart';
// import 'package:unimart/utils/constants/text_strings.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter/widgets.dart';
// import 'package:unimart/utils/constants/colors.dart';

// import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
// import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges.dart';
// import '../../../../../common/widgets/common_widgets/image_text_widgets/vertical_image_text.dart';
// import '../../../../../common/widgets/common_widgets/Images/t_rounded_image.dart';
import '../../../../../common/widgets/common_widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/common_widgets/texts/section_heading.dart';
import '../../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../../common/widgets/custom_shapes/containers/search_container.dart';
// import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return  Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(children: 
              [
                ///AppBar
                 THomeAppBar(),
                 SizedBox(height: TSizes.spaceBtwSections),

                ///Search Bar
                TSearchContainer(text: 'Search in Store',showBorder: false),
                SizedBox(height: TSizes.spaceBtwSections),

                ///Categories
                Padding(padding: EdgeInsets.only(left: TSizes.defaultSpace),child: Column(children: [
                TSectionHeading(title: 'Popular Categories',showActionButton: false , textColor: Colors.white),
                SizedBox(height: TSizes.spaceBtwItems),

                /// Horizontal scrollable categories
                THomeCategory(),   


                ],
                ),
                ),
                 SizedBox(height: TSizes.spaceBtwSections),
              ],

              ),
              ),
                
             ///Body   
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child:Column(
                children:[
                const TPromoSlider(),
                const SizedBox(height: TSizes.spaceBtwSections),

                //Heading
                TSectionHeading(title: 'Popular Products', 
                onPressed: () => Get.to(() => AllProducts(
                  title: 'Popular Products',
                  // query: FirebaseFirestore.instance.collection('Products').where('IsFeatured',isEqualTo: true).limit(6), 26-06-2024
                  futureMethod: controller.fetchAllFeaturedProducts(),
                  ),
                  ),
                  ),
                const SizedBox(height: TSizes.spaceBtwItems),


                 ///Popular Products
                 Obx(() {
                  if(controller.isLoading.value) return const TVerticalProductShimmer();
                 
                  if(controller.featuredProducts.isEmpty){
                    return Center(child: Text('No Data Found!',style: Theme.of(context).textTheme.bodyMedium));
                  }

                  return TGridLayout(itemCount: controller.featuredProducts.length, 
                  itemBuilder:(_, index) => 
                  TProductCardVertical(product: controller.featuredProducts[index]),
                  );
                 })
               
                ],
              ),
              ),
    ],
    ),
    ),
    );
  }
}





