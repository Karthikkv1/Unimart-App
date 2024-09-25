// File Created on 21-05-2024 3:40PM

import 'package:flutter/material.dart';
import 'package:unimart/bindings/general_bindings.dart';
import 'package:unimart/routes/app_routes.dart';
// import 'package:unimart/features/authentication/screens/onboarding/onboarding.dart';
import 'package:unimart/utils/constants/colors.dart';
import 'package:unimart/utils/theme/theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App ({super.key});

  @override
  Widget build(BuildContext context){
    return  GetMaterialApp(           //Note:Material App is a entry point for our app
    themeMode: ThemeMode.system,  //To get default theme of system 8:28PM 20-05-2024
                                  

    theme: TAppTheme.lightTheme,

    darkTheme:TAppTheme.darkTheme,
    initialBinding: GeneralBindings(),
    getPages: AppRoutes.pages,
     ///Show Loader or Circular Progress Indicator meanwhile Authentication Repository is deciding to show relevant screen
    
    home: const Scaffold(backgroundColor: TColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white))),

    );
  }
}
