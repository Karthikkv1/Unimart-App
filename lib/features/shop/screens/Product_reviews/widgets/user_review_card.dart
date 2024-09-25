import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:unimart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:unimart/common/widgets/products/Ratings/rating_indicator.dart';
import 'package:unimart/utils/constants/colors.dart';
import 'package:unimart/utils/constants/image_strings.dart';
import 'package:unimart/utils/constants/sizes.dart';
import 'package:unimart/utils/helpers/helper_functions.dart';

///File Created on 01-06-2024 3:10PM

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
   final dark = THelperFunctions.isDarkMode(context);
   return  Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(backgroundImage: AssetImage(TImages.userProfileImage1)),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text('John Doe',style: Theme.of(context).textTheme.titleLarge),
             
            ],
          ),
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
        ],
      ),
     const SizedBox(height: TSizes.spaceBtwItems),
      ///Review
      Row(
        children: [
          const TRatingBarIndicator(rating: 4),
          const SizedBox( width: TSizes.spaceBtwItems),
          Text('01 MAY 2024', style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),

      const SizedBox(height : TSizes.spaceBtwItems),
       const ReadMoreText(
        'The User inteface of the app is quite intvitive. I was able to navigate and make purchases seamlessly. Great job!',
        trimLines: 1,
        trimMode: TrimMode.Line,
        trimExpandedText: 'Show Less',
        trimCollapsedText: 'Show More',
        moreStyle:TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: TColors.primary),
        lessStyle:TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: TColors.primary),

      ),

      const SizedBox(height: TSizes.spaceBtwItems),

      ///Company Reviews
      TRoundedContainer(
        backgroundColor:  dark ? TColors.darkerGrey : TColors.grey,
        child: Padding(
          padding: const EdgeInsets.all(TSizes.md),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("UNIMART",style: Theme.of(context).textTheme.titleMedium),
                  Text("01 MAY,2024",style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),

      const SizedBox(height : TSizes.spaceBtwItems),
      const ReadMoreText(
      'The User inteface of the app is quite intvitive. I was able to navigate and make purchases seamlessly. Great job!',
      trimLines: 1,
      trimMode: TrimMode.Line,
      trimExpandedText: 'Show Less',
      trimCollapsedText: 'Show More',
      moreStyle:TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: TColors.primary),
      lessStyle:TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: TColors.primary),

      ),

            ],
          ),
          ),


      ),
      const SizedBox(height: TSizes.spaceBtwSections),
    ],
   );
  }
}