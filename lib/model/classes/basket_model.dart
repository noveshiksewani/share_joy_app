import 'package:uuid/uuid.dart';

const uuid = Uuid();
class Cart{
   final String id;
    final int productId;
   final String price;
    final String productImage;
     int quantity;
    final String productName;
    final String type;
    Cart({required this.price, required this.productId, required this.productName, required this.productImage,required this.quantity, required this.type,String? id}): id = id??uuid.v4();
}
class BasketItems{
   final List<Cart> cart;
   final double subTotal;
  BasketItems({required this.cart,required this.subTotal});
}