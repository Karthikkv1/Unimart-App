//File Created on 06-07-2024 3:00 PM

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:unimart/common/widgets/success_screen/success_screen.dart';
import 'package:unimart/data/order/order_repository.dart';
import 'package:unimart/data/repositories/authentication/authentication_repository.dart';
import 'package:unimart/features/personalization/controllers/address_controller.dart';
import 'package:unimart/features/shop/controllers/product/cart_controller.dart';
import 'package:unimart/features/shop/controllers/product/checkout_controller.dart';
import 'package:unimart/features/shop/models/order_model.dart';
import 'package:unimart/navigation_menu.dart';
import 'package:unimart/utils/constants/enums.dart';
import 'package:unimart/utils/constants/image_strings.dart';
import 'package:unimart/utils/popups/full_screen_loader.dart';
import 'package:unimart/utils/popups/loaders.dart';


class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  /// Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  /// Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Add methods for order processing
  void processOrder(double totalAmount) async {
    try{
      //Start  loader
      TFullScreenLoader.openLoadingDialog('Processing your order', TImages.pencilAnimation);

      //Get user authentication id
      final userId = AuthenticationRepository.instance.authUser.uid;
      if(userId.isEmpty) return;


      //Add Details
      final order = OrderModel(
        id: UniqueKey().toString(), //Generate unique ID for the order
        userId: userId,
       status: OrderStatus.pending, 
       totalAmount: totalAmount,
       orderDate: DateTime.now(),
       paymentMethod: checkoutController.selectedPaymentMethod.value.name,
       address: addressController.selectedAddress.value,

       //Set Date as needed
       deliveryDate: DateTime.now(),
       items: cartController.cartItems.toList(),
       );

       //Save the order to Firebase
       await orderRepository.saveOrder(order, userId);

       //update the cart status
       cartController.clearCart();

       //Show Success screen
       Get.off(() => SuccessScreen(
        image: TImages.orderCompletedAnimation, 
        title: 'Payment Success!', 
        subtitle: 'Your Item will be shipped soon!', 
        onPressed: () => Get.offAll(() => const NavigationMenu()
        )
        )
        );
    }
    catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());

    }
  }
}

