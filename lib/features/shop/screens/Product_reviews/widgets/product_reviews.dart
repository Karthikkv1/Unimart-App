import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:iconsax/iconsax.dart';
import 'package:unimart/common/widgets/appbar/appbar.dart';
import 'package:unimart/common/widgets/products/Ratings/rating_indicator.dart';
// import 'package:unimart/features/shop/screens/Product_reviews/widgets/progress_indicator_and_rating.dart';
import 'package:unimart/features/shop/screens/Product_reviews/widgets/rating_progress_indicator.dart';
import 'package:unimart/features/shop/screens/Product_reviews/widgets/user_review_card.dart';
// import 'package:unimart/utils/constants/colors.dart';
// import 'package:unimart/utils/constants/colors.dart';
import 'package:unimart/utils/constants/sizes.dart';
// import 'package:unimart/utils/device/device_utility.dart';

///File Created on 1-06-2024 1:54PM

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: const TAppBar(title: Text('Reviews & Rating'), showBackArrow: true),

      ///Body
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Ratings and reviews are verified and are from people who use the same type of device that you use."),
            const SizedBox(height: TSizes.spaceBtwItems),

            ///Overall Product Ratings
            const TOverallProductRating(),

            const TRatingBarIndicator(rating: 3.5),
            Text("12,611",style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: TSizes.spaceBtwSections),

            ///User Reviews List
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),

          ],
        ),
        ),

      ),
    );
   
  }
}




