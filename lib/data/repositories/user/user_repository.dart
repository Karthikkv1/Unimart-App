import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unimart/Exceptions/firebase_exception.dart';
import 'package:unimart/Exceptions/format_exception.dart';
import 'package:unimart/Exceptions/platform_exception.dart';
import 'package:unimart/data/repositories/authentication/authentication_repository.dart';
import 'package:unimart/features/personalization/models/user_model.dart';

///File created on 13-06-2024 4:40PM


class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //Function to save user data to Firestore

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
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


  //Function to fetch user details based on user ID.
    Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      }
      else{
        return UserModel.empty();
      }
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

  //Function to update user data in Firestore
    Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db.collection("Users").doc(updatedUser.id).update(updatedUser.toJson());
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

   ///Update any field in specific Users Collection
    Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
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

  ///Function to remove user data from Firestore
    Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
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

  /// Upload any Image
  Future<String> uploadImage(String path, XFile image) async{

    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));

      final url = await ref.getDownloadURL();
      return url;


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