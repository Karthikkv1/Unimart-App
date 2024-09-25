import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
// import 'package:iconsax/iconsax.dart';
import 'package:unimart/common/widgets/appbar/appbar.dart';
import 'package:unimart/common/widgets/common_widgets/list_tiles/settings_menu_tile.dart';
// import 'package:unimart/common/widgets/common_widgets/Images/t_circular_image.dart';
import 'package:unimart/common/widgets/common_widgets/list_tiles/user_profile.dart';
import 'package:unimart/common/widgets/common_widgets/texts/section_heading.dart';
import 'package:unimart/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:unimart/features/authentication/screens/login/login.dart';
import 'package:unimart/features/authentication/screens/login/widgets/signup/signup.dart';
import 'package:unimart/features/personalization/screens/address/widgets/address.dart';
import 'package:unimart/features/personalization/screens/profile/widgets/profile.dart';
import 'package:unimart/features/shop/screens/order/order.dart';
import 'package:unimart/utils/constants/colors.dart';
// import 'package:unimart/utils/constants/image_strings.dart';
import 'package:unimart/utils/constants/sizes.dart';

///File Created on 30-05-2024 10:22PM

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
 
        ///Header
        TPrimaryHeaderContainer(
          child: Column(
          children: [
            TAppBar(title: Text('Account',style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white))),
           

            ///User Profile card
             TUserProfileTile(onPressed : () => Get.to(() => const ProfileScreen())),
             const SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),
        ),


        ///Body
         Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [

              ///Account Settings
               const TSectionHeading(title: 'Account Settings',showActionButton: false),
               const SizedBox(height: TSizes.spaceBtwItems),

               TSettingMenuTile(
                icon: Iconsax.safe_home,
                title: 'My Address',
                subTitle: 'Set Shopping delivery address',
                onTap: () => Get.to(() => const UserAddressScreen()),
                ),

                const TSettingMenuTile(
                icon: Iconsax.shopping_cart,
                title: 'My Cart',
                subTitle: 'Add, remove products and move to checkout',
                // onTap: (){},
                ),

                TSettingMenuTile(
                icon: Iconsax.bag_tick,
                title: 'My Orders',
                subTitle: 'In-progress and Completed Orders',
                onTap: () => Get.to(() => const OrderScreen()),
                ),

                const TSettingMenuTile(
                icon: Iconsax.bank,
                title: 'Bank Account',
                subTitle: 'Withdraw balance to registered bank account',
                // onTap: (){},
                ),

                // const TSettingMenuTile(
                // icon: Iconsax.safe_home,
                // title: 'My Address',
                // subTitle: 'Set Shopping delivery address',
                // // onTap: (){},
                // ),

                const TSettingMenuTile(
                icon: Iconsax.discount_shape,
                title: 'My Coupons',
                subTitle: 'List of all the discounted coupons',
                // onTap: (){},
                ),

                const TSettingMenuTile(
                icon: Iconsax.notification,
                title: 'Notifications',
                subTitle: 'Set any kind of notification message',
                // onTap: (){},
                ),

                const TSettingMenuTile(
                icon: Iconsax.security_card,
                title: 'Account Privacy',
                subTitle: 'Manage data usage and connected accounts',
                // onTap: (){},
                ),


                ///App Settings
                const SizedBox(height: TSizes.spaceBtwSections),
                const TSectionHeading(title: 'App Settings',showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),
                const TSettingMenuTile(icon: Iconsax.document_upload, title:'Load Data', subTitle:'Upload Data to your Cloud Firebase'),

                TSettingMenuTile(
                 icon: Iconsax.location,
                 title:'Geolocation', 
                 subTitle:'Set recommendation based on location',
                 trailing: Switch(value: true, onChanged: (value){}),
                 ),


                TSettingMenuTile(
                 icon: Iconsax.security_user,
                 title:'Safe Mode', 
                 subTitle:'Search Result is safe for all ages',
                 trailing: Switch(value: false, onChanged: (value){}),
                 ),

                TSettingMenuTile(
                 icon: Iconsax.image,
                 title:'HD Image Quality', 
                 subTitle:'Set image quality to be seen',
                 trailing: Switch(value: false, onChanged: (value){}),
                 ),

                ///Logout Button
                const SizedBox(
                  height:TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: () => Get.to(const LoginScreen()), child: const Text('Logout')), //modified on 15-06-2024 10:13AM
                  ),
                  const SizedBox(
                  height:TSizes.spaceBtwSections * 2.5),
                  


            ],),
          )
          
          ],
        ),
      ),
    );
  }
}

