import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:get/get.dart';
import 'package:unimart/common/widgets/common_widgets/texts/section_heading.dart';
import 'package:unimart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:unimart/features/shop/controllers/product/checkout_controller.dart';
import 'package:unimart/utils/constants/colors.dart';
import 'package:unimart/utils/constants/image_strings.dart';
import 'package:unimart/utils/constants/sizes.dart';
import 'package:unimart/utils/helpers/helper_functions.dart';

///File Created on 02-06-2024 10:07AM

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({
    super.key
    });

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(CheckoutController()); //06-07-2024 2:02PM
    

    
    final dark = THelperFunctions.isDarkMode(context);
    return  Column(
     children: [
       TSectionHeading(title: 'Payment Method', buttonTitle: 'Change',onPressed: () => controller.selectPaymentMethod(context)),
       const SizedBox(height: TSizes.spaceBtwItems / 2),
       Obx(
         () =>  Row(
          children: [
            TRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? TColors.light : TColors.white,
              padding: const EdgeInsets.all(TSizes.sm),
              // child: const Image(image: AssetImage(TImages.paypal), fit: BoxFit.contain),
               child:  Image(image: AssetImage(controller.selectedPaymentMethod.value.image), fit: BoxFit.contain),
            ),
         
           const SizedBox(width: TSizes.spaceBtwItems / 2),
           Text('controller.selectedPaymentMethod.value.name',style:Theme.of(context).textTheme.bodyLarge),  
           
          ],
         ),
       )
     ],
    );
  }
}