//File Created on 03-07-2024 4:43PM

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:unimart/common/widgets/common_widgets/texts/section_heading.dart';
import 'package:unimart/common/widgets/loaders/circular_loader.dart';
import 'package:unimart/data/repositories/address/address_repository.dart';
import 'package:unimart/data/services/Network/network_manager.dart';
import 'package:unimart/features/personalization/models/address_model.dart';
import 'package:unimart/features/personalization/screens/address/widgets/add_new_address.dart';
import 'package:unimart/features/personalization/screens/address/widgets/single_address.dart';
import 'package:unimart/utils/constants/image_strings.dart';
import 'package:unimart/utils/constants/sizes.dart';
import 'package:unimart/utils/helpers/cloud_helper_functions.dart';
import 'package:unimart/utils/popups/full_screen_loader.dart';
import 'package:unimart/utils/popups/loaders.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  //Fetch all user specific addresses
  Future<List<AddressModel>> getAllUserAddresses() async{
    try{
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere((element) => element.selectedAddress, orElse: () => AddressModel.empty());
      return addresses;
    }
    catch (e) {
      TLoaders.errorSnackBar(title: 'Address not found',message: e.toString());
      return [];
    }

  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try{

      Get.defaultDialog(
        title: '',
        onWillPop: () async {return false;},
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const TCircularLoader(),
      );


      //Clear the selected field
      if(selectedAddress.value.id.isNotEmpty){
        await addressRepository.updateSelectedField(selectedAddress.value.id, false);
      }

      //Assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      //set the selected field to true for the newly selected address
      await addressRepository.updateSelectedField(selectedAddress.value.id, true);

      Get.back();

    }
    catch (e) {
        TLoaders.errorSnackBar(title: 'Error in Selection',message: e.toString());
    }
  }

  //Add new Address
 Future addNewAddresses() async {
  try {
    // Start Loading
    TFullScreenLoader.openLoadingDialog('Storing Address...', TImages.docerAnimation);
    
    // Check Internet Connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      TFullScreenLoader.stopLoading();
      return;
    }
    
    // Form Validation
    if (!addressFormKey.currentState!.validate()) {
      TFullScreenLoader.stopLoading();
      return;
    }
    
    // Save Address Data
    final address = AddressModel(
      id: '',
      name: name.text.trim(),
      phoneNumber: phoneNumber.text.trim(),
      street: street.text.trim(),
      city: city.text.trim(),
      state: state.text.trim(),
      postalCode: postalCode.text.trim(),
      country: country.text.trim(),
      selectedAddress: true,
    );
    
    final id = await addressRepository.addAddress(address);
    
    // Update Selected Address status
    address.id = id;
    await selectAddress(address);
    
   // Remove Loader
    TFullScreenLoader.stopLoading();
    
    // Show Success Message
    TLoaders.successSnackBar(
      title: 'Congratulations',
      message: 'Your address has been saved successfully.'
    );
    
    // Refresh Addresses Data
    refreshData.toggle();
    
    // Reset fields
    resetFormFields();
    
    // Redirect
    Navigator.of(Get.context!).pop();
    
  } catch (e) {
    // Remove Loader
    TFullScreenLoader.stopLoading();
    
    // Show Error Message
    TLoaders.errorSnackBar(
      title: 'Address not found',
      message: e.toString()
    );
  }
}


Future<dynamic> selectNewAddressPopup(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (_) =>
       Container(
        padding: const EdgeInsets.all(TSizes.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Select Address', showActionButton: false),
            FutureBuilder(
              future: getAllUserAddresses(),
              builder: (_, snapshot) {
                final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                if (response != null) return response;

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) =>
                     TSingleAddress(
                      address: snapshot.data![index],
                      onTap: () async {
                        await selectAddress(snapshot.data![index]);
                        Get.back();
                      },
                    ),
                    );
                  },
                ),
              
            
            const SizedBox(height: TSizes.defaultSpace * 2),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const AddNewAddressScreen()),
                child: const Text('Add new address'),
              ),
            ),
          ],
        ),
      ),
    );
  
}

//Function to reset form fields
void resetFormFields(){
  name.clear();
  phoneNumber.clear();
  street.clear();

  postalCode.clear();
  city.clear();
  state.clear();
  country.clear();
  addressFormKey.currentState?.reset();
}

}