// import 'package:unimart/features/personalization/models/user_model.dart';
import 'package:unimart/features/shop/models/banner_model.dart';
import 'package:unimart/routes/routes.dart';
import 'package:unimart/utils/constants/image_strings.dart';

///File Created on 17-06-2024 12:33PM

class TDummyData {

 
  /// Banners
  static final List<BannerModel> banners = [
    BannerModel(imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: true),
    BannerModel(imageUrl: TImages.banner3, targetScreen: TRoutes.favourites, active: true),
    BannerModel(imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: true),
    BannerModel(imageUrl: TImages.banner5, targetScreen: TRoutes.settings, active: true),
    BannerModel(imageUrl: TImages.banner6, targetScreen: TRoutes.userAddress, active: true),
    BannerModel(imageUrl: TImages.banner7, targetScreen: TRoutes.checkout, active: false),
  ];

  ///User
//   static final UserModel user = UserModel(
//     firstName: 'Coding',
//     lastName: 'with T',
//     email: 'support@codingwithT.com',
//     phoneNumber: '+14155552671',
//     profilePicture: TImages.user,
//     addresses: [
//       AddressModel(
//         id: '1',
//         name: 'Coding with T',
//         phoneNumber: '+923178059528',
//         street: '82356 Timmy Coves',
//         city: 'South Liana',
//         state: 'Maine',
//         country: 'USA',
//         postalCode: '87665',
//       ),
//       AddressModel(
//         id: '6',
//         name: 'John Doe',
//         phoneNumber: '+14155552671',
//         street: 'SOME ADDRESS', // Fill in with actual street address
//         city: 'SOME CITY', // Fill in with actual city
//         state: 'SOME STATE', // Fill in with actual state
//         country: 'SOME COUNTRY', // Fill in with actual country
//         postalCode: 'SOME POSTAL CODE', // Fill in with actual postal code
//       ),
//     ],
//   );
// }


}