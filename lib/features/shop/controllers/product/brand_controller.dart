//File Created on 26-06-2024 3:54PM

import 'package:get/get.dart';
import 'package:unimart/data/repositories/brands/brand_repository.dart';
import 'package:unimart/data/repositories/product/product_repository.dart';
import 'package:unimart/features/shop/models/brand_model.dart';
import 'package:unimart/features/shop/models/product_model.dart';
import 'package:unimart/utils/popups/loaders.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  RxBool isLoading = true.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit(){
    getFeaturedBrands();
    super.onInit();
  }

  ///Load Brands
  Future<void> getFeaturedBrands() async {
    try{

      ///Show loader while loading brands
      isLoading.value = true;

      final brands = await brandRepository.getAllBrands();

      ///Assigning brands
      allBrands.assignAll(brands);

      ///Featured Brands
      featuredBrands.assignAll(allBrands.where((brand) => brand.isFeatured ?? false).take(4));


    }
    catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
    finally {
      ///Stop Loader
      isLoading.value = false;
    }
  }

  //Get Brands For Category //27-06-2024 10:28PM
    Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
    final brands = await brandRepository.getBrandsForCategory(categoryId);
    return brands;
    }
    catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
      return [];
    }
  }





  ///Get Brand Specific Products from your data source
  Future<List<ProductModel>> getBrandProducts({required String brandId, int limit = -1}) async {
    try {
    final products = await ProductRepository.instance.getProductsForBrand(brandId: brandId, limit: limit);
    return products;
    }
    catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
      return [];
    }
  }
  




}