import 'package:get/get.dart';
import 'package:unimart/data/services/Network/network_manager.dart';
import 'package:unimart/features/personalization/controllers/address_controller.dart';
import 'package:unimart/features/shop/controllers/product/checkout_controller.dart';
// import 'package:unimart/features/shop/controllers/product/favourites_controller.dart';
import 'package:unimart/features/shop/controllers/variation_controller.dart';

///File Created on 11-06-2024 7:32AM

class GeneralBindings extends Bindings {
  @override   
  void dependencies(){
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckoutController());
    // Get.put(FavouritesController()); commented on 06-07-2024 10:23AM
  }
}