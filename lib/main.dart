import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:unimart/data/repositories/authentication/authentication_repository.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:unimart/firebase_options.dart';
// import 'package:unimart/utils/constants/colors.dart';
// import 'package:unimart/utils/theme/theme.dart';

import 'app.dart'; // 21-05-2024 3:43PM 

Future<void> main() async {

   ///Adding Widgets Binding 08-06-2024
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  ///-Getx Local Storage
   await GetStorage.init();

  ///Await Splash until other item load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);  

  //Initialise Firebase
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform).then((FirebaseApp value) => Get.put(AuthenticationRepository()),
    );
    
   
  runApp(const App());
}





