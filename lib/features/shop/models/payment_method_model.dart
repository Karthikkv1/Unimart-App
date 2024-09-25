//File Created on 06-07-2024 12:10PM

class PaymentMethodModel{
  String name;
  String image;

  PaymentMethodModel({required this.image, required this.name});

  static PaymentMethodModel empty() => PaymentMethodModel(
  image: '', 
  name: '') ;
}