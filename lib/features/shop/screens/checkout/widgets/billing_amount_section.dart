///File Created on 02-06-2024 11:10AM
library;

import 'package:flutter/material.dart';
import 'package:unimart/features/shop/controllers/product/cart_controller.dart';
import 'package:unimart/utils/constants/sizes.dart';
import 'package:unimart/utils/helpers/pricing_calculator.dart';

///File Created 0n 02-06-2024 10:09AM

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({
    super.key
    });

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    return  Column(
      children: [
        ///Sub Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('SubTotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$$subTotal', style: Theme.of(context).textTheme.bodyMedium),

          ],
        ),
        const SizedBox(height:TSizes.spaceBtwItems / 2),

        ///Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$${TPricingCalculator.calculateShippingCost(subTotal, 'US')}', style: Theme.of(context).textTheme.labelLarge),

          ],
        ),


        const SizedBox(height:TSizes.spaceBtwItems / 2),

        ///Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$${TPricingCalculator.calculateTax(subTotal, 'US')}', style: Theme.of(context).textTheme.labelLarge),

          ],
        ),


        const SizedBox(height:TSizes.spaceBtwItems / 2),

        ///Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$${TPricingCalculator.calculateTotalPrice(subTotal, 'US')}', style: Theme.of(context).textTheme.titleMedium),

          ],
        ),
      ],
    );
  }
}