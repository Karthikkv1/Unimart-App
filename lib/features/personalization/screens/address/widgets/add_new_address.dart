import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimart/common/widgets/appbar/appbar.dart';
import 'package:unimart/features/personalization/controllers/address_controller.dart';
import 'package:unimart/utils/constants/sizes.dart';
import 'package:unimart/utils/validators/validation.dart';

///File Created on 01-06-2024 6:41PM

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;


    return  Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Add new Address')
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey, //05-07-2024 6:05AM

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value) => TValidator.validateEmptyText('Name', value),
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user),labelText: 'Name')),
                  const SizedBox(height:TSizes.spaceBtwInputFields),

                TextFormField(
                  controller: controller.phoneNumber,
                  validator:  TValidator.validatePhoneNumber,
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile),labelText: 'Phone Number')),
                  const SizedBox(height:TSizes.spaceBtwInputFields),

                Row(
                  children: [
                  Expanded(
                    child: TextFormField(
                    controller: controller.street,
                    validator: (value) => TValidator.validateEmptyText('Street', value),
                    decoration: const InputDecoration(labelText: 'Street',prefixIcon: Icon(Iconsax.building_31)),
                    ),
                    ),
                     const SizedBox(height:TSizes.spaceBtwInputFields),

                      Expanded(
                    child: TextFormField(
                    controller: controller.postalCode,
                    validator: (value) => TValidator.validateEmptyText('Postal Code', value),
                    decoration: const InputDecoration(labelText: 'Postal Code',prefixIcon: Icon(Iconsax.code)),
                    ),
                    ),

                   
                  

                  ],
                ),
              const SizedBox(height:TSizes.spaceBtwInputFields),

              Row(
                  children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.city,
                      validator: (value) => TValidator.validateEmptyText('City', value),
                      expands: false,
                       decoration: const InputDecoration(labelText: 'City',prefixIcon: Icon(Iconsax.building)),
                     )),
                  const SizedBox(width:TSizes.spaceBtwInputFields),

                  Expanded(child: TextFormField(
                    controller: controller.state,
                    validator: (value) => TValidator.validateEmptyText('State', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: 'State',prefixIcon: Icon(Iconsax.activity)),

                    )),

                  ],
                ),
                const SizedBox(height:TSizes.spaceBtwInputFields),
                TextFormField(
                   controller: controller.country,
                    validator: (value) => TValidator.validateEmptyText('Country', value),

                  
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global),labelText: 'Country')),
                const SizedBox(height:TSizes.defaultSpace),

                SizedBox(width: double.infinity, child: ElevatedButton(onPressed:() => controller.addNewAddresses(), child: const Text('Save')),)


              ],
              
            ),
          ),
        ),
      ),
    );
  }
}