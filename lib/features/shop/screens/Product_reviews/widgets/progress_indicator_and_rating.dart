import 'package:flutter/material.dart';
import 'package:unimart/utils/constants/colors.dart';
import 'package:unimart/utils/device/device_utility.dart';

///File Created on 01-06-2024 2:45PM

class TRatingProgressIndicator extends StatelessWidget {
  const TRatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1 , child: Text(text,style: Theme.of(context).textTheme.bodyMedium)),
         Expanded(
          flex: 11,
           child: SizedBox(
             width: TDeviceUtils.getScreenWidth(context) * 0.5,
             child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: TColors.grey,
              valueColor: const AlwaysStoppedAnimation(TColors.primary),
              borderRadius: BorderRadius.circular(7),
                                     ),
           ),
         ),
      ],
    );
  }
}