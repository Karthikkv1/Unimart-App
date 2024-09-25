import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:unimart/common/widgets/custom_shapes/containers/rounded_container.dart';
// import 'package:unimart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:unimart/common/widgets/products/cart/coupon_widget.dart';
import 'package:unimart/common/widgets/success_screen/success_screen.dart';
import 'package:unimart/features/shop/controllers/product/cart_controller.dart';
import 'package:unimart/features/shop/controllers/product/order_controller.dart';
import 'package:unimart/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:unimart/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:unimart/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:unimart/features/shop/screens/checkout/widgets/billing_payment_sevtion.dart';
import 'package:unimart/navigation_menu.dart';
import 'package:unimart/utils/constants/colors.dart';
import 'package:unimart/utils/constants/image_strings.dart';
// import 'package:unimart/utils/constants/colors.dart';
import 'package:unimart/utils/constants/sizes.dart';
import 'package:unimart/utils/helpers/helper_functions.dart';
import 'package:unimart/utils/helpers/pricing_calculator.dart';
import 'package:unimart/utils/popups/loaders.dart';

import '../../../../../common/widgets/appbar/appbar.dart';

///File Created on 02-06-2024 9:15AM


class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;

    final orderController = Get.put(OrderController());
    final totalAmount = TPricingCalculator.calculateTotalPrice(subTotal, 'US');


    final dark = THelperFunctions.isDarkMode(context);
    return  Scaffold(
       appBar: TAppBar(showBackArrow: true,title: Text('Order Review',style: Theme.of(context).textTheme.headlineSmall)),
       body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [

              ///Items in Cart
              const TCartItems(showAddRemoveButtons: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///Coupon TextField
              const TCouponCode(),
              const SizedBox(height:TSizes.spaceBtwSections),

              ///Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    ///Pricing
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    ///Divider
                    Divider(),
                    SizedBox(height:TSizes.spaceBtwItems),

                    ///Payment Methods
                     TBillingPaymentSection(),
                     SizedBox(height:TSizes.spaceBtwItems),

                    ///Address
                    TBillingAddressSection()
                  ],
                ),
              )
            ],
          ),
        ),
       ),
       
      ///Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: subTotal > 0 ?
          () => orderController.processOrder(totalAmount)
          : () => TLoaders.warningSnackBar(title: 'Empty Cart',message: 'Add items in the cart in order to proceed.'),
          child: Text('Checkout \$$totalAmount'
          ),
          
          ),
          ),
      );
    
  }
}

// Get.to(
//             () => SuccessScreen(
//             // image: TImages.successfulPaymentIcon,
//              image: TImages.animalIcon,
//             title: 'Payment Success!',
//             subtitle: 'Your item will be shipped soon!',
//             onPressed: () => Get.offAll(() => const NavigationMenu()),
//           ),