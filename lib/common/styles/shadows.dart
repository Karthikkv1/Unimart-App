//File Created on 28-05-2024  9:58PM

import 'package:flutter/material.dart';
import 'package:unimart/utils/constants/colors.dart';

class TShadowStyle {

 static final verticalProductShadow = BoxShadow(
  color: TColors.darkGrey.withOpacity(0.1),
  blurRadius: 50,
  spreadRadius: 7,
  offset: const Offset(0, 2)
 );

 
 static final horizontalProductShadow = BoxShadow(
  color: TColors.darkGrey.withOpacity(0.1),
  blurRadius: 50,
  spreadRadius: 7,
  offset: const Offset(0, 2)
 );

}