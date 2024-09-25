// File Created on 21-05-2024 2:14PM

import 'package:flutter/material.dart';

/// Custom class for light and Dark Text Themes 

class TCheckboxTheme {
  TCheckboxTheme._();

  /// Customizable Light Text  Theme
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states){
      if (states.contains(WidgetState.selected)){
        return Colors.white;
      }
      else{
        return Colors.black;
      }

    }
    ),
    fillColor: WidgetStateProperty.resolveWith((states){
      if(states.contains(WidgetState.selected)){
        return Colors.blue;
      }
      else{
        return Colors.transparent;
      }
    }),
  );



    /// Customizable Light Text  Theme
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states){
      if (states.contains(WidgetState.selected)){
        return Colors.white;
      }
      else{
        return Colors.black;
      }

    }
    ),
    fillColor: WidgetStateProperty.resolveWith((states){
      if(states.contains(WidgetState.selected)){
        return Colors.blue;
      }
      else{
        return Colors.transparent;
      }
    }),
  );


}