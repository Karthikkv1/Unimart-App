import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimart/common/widgets/appbar/appbar.dart';
import 'package:unimart/common/widgets/common_widgets/layouts/grid_layout.dart';
import 'package:unimart/common/widgets/icons/t_circular_icon.dart';
import 'package:unimart/common/widgets/loaders/animation_loader.dart';
import 'package:unimart/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:unimart/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:unimart/features/shop/controllers/product/favourites_controller.dart';
import 'package:unimart/features/shop/models/product_model.dart';
import 'package:unimart/features/shop/screens/home/widgets/home.dart';
import 'package:unimart/navigation_menu.dart';
import 'package:unimart/utils/constants/image_strings.dart';
import 'package:unimart/utils/constants/sizes.dart';
import 'package:unimart/utils/helpers/cloud_helper_functions.dart';

///File Created on 30-05-2024 9:28PM

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen()),)
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),

          //Products Grid
          child: Obx(
            () => FutureBuilder(
              future: controller.favoriteProducts(),
              builder:(context, snapshot){
            
            
                //Nothing Found Widget
                final emptyWidget = TAnimationLoaderWidget(
                  text: 'Whoops! Wishlist is Empty...',
                  animation: TImages.pencilAnimation,
                  showAction: true,
                  actionText: 'Let\'s add some',
                  onActionPressed: () => Get.off(() => const NavigationMenu()),
                );
            
                //To fix null check operator used on a null value . 02-07-2024 10:15PM
                const loader = TVerticalProductShimmer(itemCount: 6);
                final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader,nothingFound: emptyWidget);
                if(widget != null) return widget;
            
                final products = snapshot.data!;
            
            
            
                return TGridLayout(itemCount: products.length, 
                itemBuilder: (_, index) =>  TProductCardVertical(product: products[index]));
              }
            ),
          ),
          ),
          ),
          );
    
  }
}