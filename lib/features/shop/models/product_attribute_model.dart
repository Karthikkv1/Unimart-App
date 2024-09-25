///File Created on 18-06-2024 7:59AM

class ProductAttributeModel {
  String? name;
  final List<String>? values;

  ProductAttributeModel({this.name,this.values});

  ///Json Format
   toJson(){
    return {'Name':name,'Values':values};
   }

   ///Map Json oriented document snapshot from Firebase to Model
   factory ProductAttributeModel.fromJson(Map<String, dynamic> document){
    final data = document;

    if(data.isEmpty) return ProductAttributeModel();

    return ProductAttributeModel(
      name: data.containsKey('Name') ? data['Name'] : '',
      values: List<String>.from(data['Values']),
    );
   }
  
}