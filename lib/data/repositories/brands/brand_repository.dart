//File Created on 4:14PM 26-06-2024 

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:unimart/Exceptions/firebase_exception.dart';
import 'package:unimart/Exceptions/format_exception.dart';
import 'package:unimart/Exceptions/platform_exception.dart';
import 'package:unimart/features/shop/models/brand_model.dart';



class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;
    } 
    on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching Brands.';
    }
  }

  /// Get Brands For Category
    Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {

       //Query to get all documents where categoryId matches the provided categoryid
       QuerySnapshot brandCategoryQuery = await _db.collection('BrandCategory').where('categoryId', isEqualTo:  categoryId).get();

       ///Extract brandIds from the documents
       List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();

       //Query to get all documents  where the brandId is in the list of brandIds, FieldPath.documentId to query documents in collection
       final brandsQuery = await _db.collection('Brands').where(FieldPath.documentId, whereIn:  brandIds).limit(2).get();

       //Extract brand names or other relevant data from the documents
       List<BrandModel> brands = brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

       return brands;
    } 
    on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching Brands.';
    }
  }

}
