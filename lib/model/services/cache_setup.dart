import 'package:share_joy/model/classes/basket_model.dart';

class CacheData {
  static final List<Cart> _cart = [];
  static final List<Cart> _giftRegistry = [];
  static final List<Cart> _wishList = [];
  
  static Future<BasketItems> loadBasket(String type) async {
   try {
    double subTotal = 0;
   switch (type) {
    case "cart":
     for (var row in _cart) {
      subTotal =
          subTotal + (double.tryParse(row.price) ?? 0.0) * (row.quantity);
    }
      return BasketItems(cart: _cart, subTotal: subTotal);
    case "wishList":
         return BasketItems(cart: _wishList, subTotal: subTotal);
    case "giftRegistry":
         return BasketItems(cart: _giftRegistry, subTotal: subTotal);
    default:
       return  BasketItems(cart: [], subTotal: subTotal);  
   }
   }
    catch(exception)
      {
        return BasketItems(cart: [], subTotal: 0);
      }
  }

  static Future<bool> inserData(Cart cart) async {
   try{ switch (cart.type) {
      case "wishList":
       var check = _wishList
            .where((element) => (element.productId == cart.productId &&
                element.type == "wishList")).toList();
        if (check.isEmpty) _wishList.add(cart);
        return true;
      case "giftRegistry":
        var check = _giftRegistry
            .where((element) => (element.productId == cart.productId &&
                element.type == "giftRegistry"))
            .toList();
        if (check.isEmpty) _giftRegistry.add(cart);
        return true;
      case "cart":
        var check = _cart
            .where((element) =>
                (element.productId == cart.productId && element.type == "cart")).toList();
        if (check.isEmpty) {
          _cart.add(cart);
        } else {
          _cart.removeWhere((element) => element.id == check.first.id);
          cart.quantity = check.first.quantity + cart.quantity;
          _cart.add(cart);
        }
        return true;
      default:
        return false;
    }}
    catch(exception)
      {
        return false;
      }
  }

  static Future<bool> deleteDataById(String id, String type) async {
    try{switch (type) {
      case "wishList":
        _wishList.removeWhere((element) => element.id == id);
        return true;
      case "giftRegistry":
        _giftRegistry.removeWhere((element) => element.id == id);
        return true;
      case "cart":
        _cart.removeWhere((element) => element.id == id);
        return true;
      default:
        return false;
    }
    }
    catch(exception)
      {
        return false;
      }
  }
  
  static Future<bool> incAndDecQuantityInCart(String type, String id) async {
    try{final Cart check = _cart
            .where((element) => element.id == id)
            .first;
     if (type == "increase") {
       _cart.removeWhere((element) => element.id == id);
          check.quantity = check.quantity+1;
          _cart.add(check);
      }
      if (type == "decrease") {
       _cart.removeWhere((element) => element.id == id);
          check.quantity = check.quantity-1;
          _cart.add(check);
      }
      return true;}
      catch(exception)
      {
        return false;
      }
  }
}
