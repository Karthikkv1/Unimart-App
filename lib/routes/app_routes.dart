import 'package:get/get.dart';
import 'package:unimart/features/authentication/screens/login/login.dart';
import 'package:unimart/features/authentication/screens/login/widgets/signup/signup.dart';
import 'package:unimart/features/authentication/screens/login/widgets/signup/widgets/verify_email.dart';
import 'package:unimart/features/authentication/screens/onboarding/onboarding.dart';
import 'package:unimart/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:unimart/features/personalization/screens/address/widgets/address.dart';
import 'package:unimart/features/personalization/screens/profile/widgets/profile.dart';
import 'package:unimart/features/personalization/screens/settings/settings.dart';
import 'package:unimart/features/shop/screens/Product_reviews/widgets/product_reviews.dart';
import 'package:unimart/features/shop/screens/cart/cart.dart';
import 'package:unimart/features/shop/screens/checkout/widgets/checkout.dart';
import 'package:unimart/features/shop/screens/home/widgets/home.dart';
import 'package:unimart/features/shop/screens/order/order.dart';
import 'package:unimart/features/shop/screens/store/store.dart';
import 'package:unimart/features/shop/screens/wishlist/wishlist.dart';
import 'package:unimart/routes/routes.dart';

///File Created on 17-06-2024 8:45PM

class AppRoutes {

  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    GetPage(name: TRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingScreen()),
    GetPage(name: TRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: TRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
  
}