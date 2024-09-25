import 'package:flutter/material.dart';
import 'package:unimart/common/widgets/appbar/appbar.dart';
import 'package:unimart/features/shop/screens/order/widget/orders_list.dart';
import 'package:unimart/utils/constants/sizes.dart';

///File Created on 02-06-2024 2:20PM

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///AppBar
      appBar: TAppBar(title: Text('My Orders',style: Theme.of(context).textTheme.headlineSmall),showBackArrow: true),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        ///Orders
        child: TOrderListItems(),
      ),
    );
  }
}