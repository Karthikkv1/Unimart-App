import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimart/common/widgets/appbar/appbar.dart';
import 'package:unimart/features/personalization/controllers/address_controller.dart';
// import 'package:unimart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:unimart/features/personalization/screens/address/widgets/add_new_address.dart';
import 'package:unimart/features/personalization/screens/address/widgets/single_address.dart';
import 'package:unimart/utils/constants/colors.dart';
import 'package:unimart/utils/constants/sizes.dart';
import 'package:unimart/utils/helpers/cloud_helper_functions.dart';

///File Created on 01-06-2024 6:37PM

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());



    return  Scaffold(
      

      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Addresses',style: Theme.of(context).textTheme.headlineSmall),

      ),

      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
              // Use key to trigger refresh
              key: Key(controller.refreshData.value.toString()),
              future: controller.getAllUserAddresses(),
            
            
            
             
              builder: (context, snapshot) {
            
                //Helper Function: Handle Loader,No Record, OR ERROR Message
                final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                if (response != null) return response;
            
                final addresses = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: addresses.length,
                  itemBuilder: (_, index) =>  TSingleAddress(address: addresses[index],
                  onTap: () => controller.selectAddress(addresses[index]),
                  ),
                  );
              }
            ),
          )),
      ),

      floatingActionButton: FloatingActionButton(onPressed: () => Get.to(() => const AddNewAddressScreen()),
      backgroundColor: TColors.primary,
      child: const Icon(Iconsax.add,color: TColors.white),
      ),
      
    );
  }
}