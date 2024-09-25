// import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:unimart/Exceptions/firebase_auth_exception.dart';
import 'package:unimart/Exceptions/firebase_exception.dart';
import 'package:unimart/Exceptions/format_exception.dart';
import 'package:unimart/Exceptions/platform_exception.dart';
import 'package:unimart/data/repositories/user/user_repository.dart';
import 'package:unimart/features/authentication/screens/login/login.dart';
import 'package:unimart/features/authentication/screens/login/widgets/signup/widgets/verify_email.dart';
import 'package:unimart/features/authentication/screens/onboarding/onboarding.dart';
import 'package:unimart/navigation_menu.dart';
import 'package:unimart/utils/local_storage/storage_utility.dart';

///File Created on 08-06-2024

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Variables
  final deviceStorage = GetStorage();
  final _auth =FirebaseAuth.instance;

  ///Get Authenticated User Data
  User get authUser => _auth.currentUser!; //Modified on 07-07-2024  8:25AM


  ///Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // @override
  // void onInit(){

  // }
  
  ///Function to show Relevant  Screen
  
  void screenRedirect() async {
    final user = _auth.currentUser; //14-06-2024 8:18PM

    if(user != null) {
      if(user.emailVerified){

        //Initialize user specific storage
        await TLocalStorage.init(user.uid);

        //If the user email is verified 
        Get.offAll(() => const NavigationMenu());
      }
      else{

         //If the user email is not  verified 
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    }
    else{
       //Local Storage
    
    // if(kDebugMode){
    //   print('========Get Storage  Auth Repo===============');
    //   print(deviceStorage.read("IsFirstTime"));
    // }

     //Local storage
     deviceStorage.writeIfNull('IsFirstTime',true);
     //check if it's first time launching the app
     deviceStorage.read('IsFirstTime') != true ? Get.offAll(() => const LoginScreen()) :  Get.offAll(const OnBoardingScreen());
    }

    

  }


  //Email and Password Sign in

  //Login

    Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    }
    on FirebaseAuthException catch(e) {
      throw TFirebaseAuthException(e.code).message;

    }
    on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    }
    on FormatException catch(_) {
      throw const TFormatException();
    }
    on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }
  }


  //Register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }
    on FirebaseAuthException catch(e) {
      throw TFirebaseAuthException(e.code).message;

    }
    on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    }
    on FormatException catch(_) {
      throw const TFormatException();
    }
    on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  ///Email Verification
  Future<void> sendEmailVerification() async {
    try{
      await _auth.currentUser?.sendEmailVerification();
    }
    on FirebaseAuthException catch(e) {
      throw TFirebaseAuthException(e.code).message;

    }
    on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    }
    on FormatException catch(_) {
      throw const TFormatException();
    }
    on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }
  }
  
  //Logout user

    Future<void> logout() async {
    try{
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut(); //14-06-2024 8:22PM
      Get.offAll(() => const LoginScreen());
    }
    on FirebaseAuthException catch(e) {
      throw TFirebaseAuthException(e.code).message;

    }
    on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    }
    on FormatException catch(_) {
      throw const TFormatException();
    }
    on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }
  }


  ///Federated identity and Social sign-in
  
  ///Google SignIn
  Future<UserCredential?> signInWithGoogle() async {
    try{

     //Trigger the authentication flow
     final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

     ///Obtain the authentication details from the request
     final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

     ///Create a new credential
     final credentials = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
     );

     ///Once signed in, return the UserCredential
     return await _auth.signInWithCredential(credentials);


    }
    on FirebaseAuthException catch(e) {
      throw TFirebaseAuthException(e.code).message;

    }
    on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    }
    on FormatException catch(_) {
      throw const TFormatException();
    }
    on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }
    catch(e){
      if (kDebugMode) print('Something went wrong: $e');
      return null;
       
    }
  }

  ///Forget Password
   Future<void> sendPasswordResetEmail(String email) async {
    try{
      await _auth.sendPasswordResetEmail(email: email);
    }
    on FirebaseAuthException catch(e) {
      throw TFirebaseAuthException(e.code).message;

    }
    on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    }
    on FormatException catch(_) {
      throw const TFormatException();
    }
    on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  ///ReAuthenticate user
    Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async {
    try{
      
      ///Create a credential
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      //ReAuthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    }
    on FirebaseAuthException catch(e) {
      throw TFirebaseAuthException(e.code).message;

    }
    on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    }
    on FormatException catch(_) {
      throw const TFormatException();
    }
    on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }
  }
  
  /// Delete user - Remove user Auth and Firestore Account.
     Future<void> deleteAccount() async {
    try{
      
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    }
    on FirebaseAuthException catch(e) {
      throw TFirebaseAuthException(e.code).message;

    }
    on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    }
    on FormatException catch(_) {
      throw const TFormatException();
    }
    on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }
  }
  

  }


   


