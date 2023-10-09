import 'package:share_joy/model/enums/enums.dart';

class Product{
 final int id;
 String name;
 String price;
 String image;
 String description;
 ProductCategory productType;
 bool canBePersonalized;
  Product({required this.id,required this.name, required this.price, required this.image, required this.canBePersonalized, required this.productType, required this.description});
}