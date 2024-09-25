import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:unimart/common/widgets/loaders/animation_loader.dart';
import 'package:unimart/features/shop/controllers/product/order_controller.dart';
import 'package:unimart/navigation_menu.dart';
import 'package:unimart/utils/constants/colors.dart';
import 'package:unimart/utils/constants/image_strings.dart';
import 'package:unimart/utils/constants/sizes.dart';
import 'package:unimart/utils/helpers/cloud_helper_functions.dart';
import 'package:unimart/utils/helpers/helper_functions.dart';

///File Created on 02-06-2024 2:26PM

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final dark = THelperFunctions.isDarkMode(context);
    return  FutureBuilder(
      future: controller.fetchUserOrders(),
      builder: (_, snapshot) {

        //Nothing Found widget
        final emptyWidget = TAnimationLoaderWidget(
          text: 'Whoops! No orders Yet!', 
          animation: TImages.orderCompletedAnimation,
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          //Helper Function: Handle loader, No record, OR error message
          final response = TCloudHelperFunctions.checkMultiRecordState(
            snapshot: snapshot,
            nothingFound: emptyWidget
            );
            if (response != null) return response;


            //Congratulations Record found
            final orders = snapshot.data!;
            return  ListView.separated(
        shrinkWrap: true,
        itemCount: orders.length,
        separatorBuilder: (_, __) => const SizedBox(height:TSizes.spaceBtwItems),
        itemBuilder: (_, index) {
           final order = orders[index];
           return TRoundedContainer(
          showBorder: true,
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor:THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.light,
          child:  Column(
            mainAxisSize: MainAxisSize.min,
        
            children: [
        
              ///Row1
              Row(
                children: [
                  
                  ///Icon1
                  const Icon(Iconsax.ship),
                  const SizedBox(width: TSizes.spaceBtwItems / 2),
        
                  ///Status and Date
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.orderStatusText,
                          overflow: TextOverflow.ellipsis,
                         style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary,fontWeightDelta: 1),
                        ),
                        Text(order.formattedOrderDate,
                        style: Theme.of(context).textTheme.headlineSmall),
                      ],
                    ),
                  ),
        
                  ///Icon
                  IconButton(onPressed:(){}, icon: const Icon(Iconsax.arrow_right_34, size: TSizes.iconSm)),
                ],
              ),
              const SizedBox(height:TSizes.spaceBtwItems),
        
              ///Bottom row
              Row(
                children: [

                  //Order Number
                  Expanded(
                    child: Row(
                      children: [
                        
                        ///Icon1
                        const Icon(Iconsax.tag),
                        const SizedBox(width: TSizes.spaceBtwItems / 2),
                    
                        ///Status and Date
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Order',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.labelMedium),

                              Text(
                                order.id,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleMedium),
                            ],
                          ),
                        ),
                    
                      
                      ],
                    ),
                  ),
        
                  Expanded(
                    child: Row(
                      children: [
                        
                        ///Icon1
                        const Icon(Iconsax.calendar),
                        const SizedBox(width: TSizes.spaceBtwItems / 2),
                    
                        ///Status and Date
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Shipping Date',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.labelMedium),

                              Text(
                                order.formattedDeliveryDate,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleMedium),
                            ],
                          ),
                        ),
                    
                      
                      ],
                    ),
                  ),
                ],
              ), 
            ],
          ),
        );
        }
      );
      },

      
    ); 
  }
}