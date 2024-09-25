// import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:unimart/data/repositories/categories/category_repository.dart';
import 'package:unimart/data/repositories/product/product_repository.dart';
import 'package:unimart/features/shop/models/category_model.dart';
import 'package:unimart/features/shop/models/product_model.dart';
import 'package:unimart/features/shop/screens/sub_category/sub_categories.dart';
import 'package:unimart/utils/popups/loaders.dart';

///File Created on 17-06-2024 9:54AM

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();
  
  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  
  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  ///Load Category data
   Future<void> fetchCategories() async {
    try {

      ///Show loader while loading categories
      isLoading.value = true;

      //Fetch categories from data source (Firestore, API, etc.)
      final categories = await _categoryRepository.getAllCategories();

      ///Update the categories list
      allCategories.assignAll(categories);

      ///Filter featured categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());

    }
    catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
    finally {
     
     ///Remove Loader
      isLoading.value = false;
    }
   }

   //Load selected category data
   Future<List<CategoryModel>> getSubCategories(String categoryId) async {

    try{
      final subCategories = await _categoryRepository.getSubCategories(categoryId);
      return subCategories;
    }
    catch (e) {
      TLoaders.errorSnackBar(title: 'oh snap!',message: e.toString());
      return [];

    }
   }

   //Get Category or Sub Category Products.
   Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async {
    try{

    //Fetch limited products against each subCategory;
    final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
    return products;
    }
    catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
      return [];
    }
   }
}