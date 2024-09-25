//File Created on 27-05-2024 10:16PM


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimart/common/widgets/loaders/category_shimmer.dart';
import 'package:unimart/features/shop/controllers/category_controller.dart';
import 'package:unimart/features/shop/screens/sub_category/sub_categories.dart';
import 'package:unimart/utils/constants/image_strings.dart';

import '../../../../../common/widgets/common_widgets/image_text_widgets/vertical_image_text.dart';


class THomeCategory extends StatelessWidget {
  const THomeCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());



    return Obx(
      
      () {
        if(categoryController.isLoading.value) return const TCategoryShimmer();

        if(categoryController.featuredCategories.isEmpty){
          return Center(child: Text('No Data Found!',style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
        }

        return  SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,

          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return TVerticalImageText(image: category.image, title: category.name, 
            onTap: () => Get.to(() =>  SubCategoriesScreen(category: category)));  //7-05-2024 9:35PM
          },
        ),
      );
      }
      
    );
  }
}