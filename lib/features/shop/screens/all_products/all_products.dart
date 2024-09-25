import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimart/common/widgets/appbar/appbar.dart';
import 'package:unimart/common/widgets/products/sortable/sortable_products.dart';
import 'package:unimart/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:unimart/features/shop/controllers/product/all_products_controller.dart';
import 'package:unimart/features/shop/models/product_model.dart';
import 'package:unimart/utils/constants/sizes.dart';
import 'package:unimart/utils/helpers/cloud_helper_functions.dart';

///File Created on 06-06-2024 11:41AM

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {

    //Initialize controller for managing product fetching
    final controller = Get.put(AllProductsController());

    return   Scaffold(
      appBar: TAppBar(title: Text(title),showBackArrow: true),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {

              /// Check the state of the FutureBuilder Snapshot
              const loader = TVerticalProductShimmer();

              final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);

              //Return appropriate widget based on snapshot state
              if(widget != null) return widget;
              

              

              /// Products found
              final products = snapshot.data!;


              return TSortableProducts(products: products);
            }
          ),

          ),
      ),
    );
  }
}

