import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:unimart/Exceptions/firebase_exception.dart';
// import 'package:unimart/Exceptions/format_exception.dart';
// import 'package:unimart/Exceptions/format_exception.dart';
import 'package:unimart/Exceptions/platform_exception.dart';
import 'package:unimart/data/services/firebase_storage_service.dart';
import 'package:unimart/features/shop/models/category_model.dart';

///File Created on 17-06-2024 9:37AM

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  ///Variables
  final _db = FirebaseFirestore.instance;

  ///Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    }
    
    on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    }
    
    on PlatformException catch (e) {
      throw TPlatformException(e.code).message; 
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }

   

  }

  ///Get Sub Categories 03-07-2024 2:55PM
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {

     try {
      final snapshot = await _db.collection("Categories").where('ParentId',isEqualTo: categoryId).get();
      final result = snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      return result;
    
     
     
  }
  on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    }
  
    on PlatformException catch (e) {
      throw TPlatformException(e.code).message; 
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }
  }
  
  
  
  
  ///Upload Categories to the Cloud Firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async {

     try {
      
    // Upload all the Categories along with their Images
     final storage = Get.put(TFirebaseStorageService());

     ///Loop through each Category
     for (var category in categories){

      //Get ImageData link from the local assets
      final file = await storage.getImageDataFromAssets(category.image);

      // Upload Image and Get its URL
      final url = await storage.uploadImageData('Categories', file, category.name);

      // Assign URL to Category.image attribute
     category.image = url;

     // Store Category in Firestore
     await _db.collection ("Categories").doc(category.id).set(category.toJson());
     }

     
     
  }
  on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    }
  
    on PlatformException catch (e) {
      throw TPlatformException(e.code).message; 
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }
  }
  

}