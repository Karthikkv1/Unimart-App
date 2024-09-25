import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimart/common/widgets/appbar/appbar.dart';
import 'package:unimart/features/personalization/screens/profile/widgets/update_name_controller.dart';
import 'package:unimart/utils/constants/sizes.dart';
import 'package:unimart/utils/constants/text_strings.dart';
import 'package:unimart/utils/validators/validation.dart';

///File Created on 16-06-2024 10:44AM

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override  
  Widget build(BuildContext context){
    final controller = Get.put(UpdateNameController());
    return Scaffold(

    ///Custom Appbar
    appBar: TAppBar (
      showBackArrow: true,
      title: Text('Change Name',style: Theme.of(context).textTheme.headlineSmall),
    ),
    body: Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ///Headings
          Text(
            'Use real name for easy verification. This name will appear on several pages.',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          ///Text field and Button
          Form(
            key: controller.updateUserNameFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.firstName,
                  validator: (value) => TValidator.validateEmptyText('First Name', value),
                  expands: false,
                  decoration: const InputDecoration(labelText: TTexts.firstName,prefixIcon: Icon(Iconsax.user)),
                ),

                const SizedBox(height:TSizes.spaceBtwInputFields),
                 TextFormField(
                  controller: controller.lastName,
                  validator: (value) => TValidator.validateEmptyText('Last Name', value),
                  expands: false,
                  decoration: const InputDecoration(labelText: TTexts.lastName,prefixIcon: Icon(Iconsax.user)),
                ),
              ],
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          ///Save Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () => controller.updateUserName(),child: const Text('Save')),
          ),
        ],
      ),
    ),

    );
  }
  
}