import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimart/common/widgets/appbar/appbar.dart';
import 'package:unimart/common/widgets/common_widgets/Images/t_rounded_image.dart';
import 'package:unimart/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:unimart/common/widgets/icons/t_circular_icon.dart';
import 'package:unimart/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:unimart/features/shop/controllers/images_controller.dart';
import 'package:unimart/features/shop/models/product_model.dart';
import 'package:unimart/utils/constants/colors.dart';
import 'package:unimart/utils/constants/image_strings.dart';
import 'package:unimart/utils/constants/sizes.dart';
import 'package:unimart/utils/helpers/helper_functions.dart';

///File Created on 31-05-2024 7:29PM

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key, required this.product
    // required this.dark,
  });

  // final bool dark;
   final ProductModel product;



  @override
  Widget build(BuildContext context) {
     final dark = THelperFunctions.isDarkMode(context);

     final controller = Get.put(ImagesController());
     final images = controller.getAllProductImages(product);

    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey: TColors.light,
        child: Stack(
          children: [
    
            ///Main Large Image
             SizedBox(height:400, child: Padding(
              padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
              child: Center(child: Obx(()
               { 

                final image = controller.selectedProductImage.value;
                return  GestureDetector(
                  onTap: () => controller.showEnlargedImage(image),
                  child: CachedNetworkImage(imageUrl: image, 
                  progressIndicatorBuilder: (_, __, downloadProgress) => 
                  CircularProgressIndicator(value: downloadProgress.progress,color: TColors.primary),
                  ),
                );
                },
                )
                ),
            ),
            ),
    
            ///Image Slider
            
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                
                itemCount: images.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                separatorBuilder:(_, __) => const SizedBox(width: TSizes.spaceBtwItems),
                
                itemBuilder:(_, index) => 
                  Obx(
                    () {
                    final imageSelected = controller.selectedProductImage.value == images[index];
                    return TRoundedImage(
                    width: 80,
                    isNetworkImage: true,
                    backgroundColor: dark ? TColors.dark : TColors.white,
                    border: Border.all(color: imageSelected ? TColors.primary : Colors.transparent),
                    padding: const EdgeInsets.all(TSizes.sm),
                    imageUrl: images[index],
                    onPressed: () => controller.selectedProductImage.value = images[index],
                    
                                    
                    );
                    },
                  ),
                ),
              ),
            ),
    
            ///Appbar Icons
             TAppBar(
              showBackArrow: true,
              actions: [
                TFavouriteIcon(productId: product.id),
              ],
            )
      
          ],
        ),
      ),
    );
  }
}