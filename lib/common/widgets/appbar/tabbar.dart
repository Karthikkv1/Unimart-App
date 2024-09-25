//File Created on 30-05-2024 2:30PM

import 'package:flutter/material.dart';
import 'package:unimart/utils/constants/colors.dart';
import 'package:unimart/utils/device/device_utility.dart';
import 'package:unimart/utils/helpers/helper_functions.dart';

class TTabBar extends StatelessWidget  implements PreferredSizeWidget{

  const TTabBar({
    super.key,
    required this.tabs
    });

    final List<Widget> tabs;


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? TColors.black : TColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: TColors.primary,
        labelColor: dark ? TColors.white : TColors.primary,
        unselectedLabelColor: TColors.darkGrey,
      ),
    );
  }
  
  @override
 
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}