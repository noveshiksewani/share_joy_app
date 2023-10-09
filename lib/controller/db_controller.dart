import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:share_joy/model/classes/basket_model.dart';
import 'package:share_joy/model/services/db_function.dart';

class DBController extends ControllerMVC {
    factory DBController() => _this ??= DBController._();
 DBController._();
  static DBController? _this;
  Future<BasketItems> loadBasket(String type) async {
    return DBFunction.loadBasket(type);
  }

  Future<bool> inserData(Cart cart) async {
    return DBFunction.inserData(cart);
  }

  Future<bool> deleteDataById(String id, String type) async {
    return DBFunction.deleteDataById(id, type);
  }

  Future<bool> deleteAllItems(String type) async {
    return DBFunction.deleteAllItems(type);
  }

  Future<bool> incAndDecQuantityInCart(String type, String id) async {
    return DBFunction.incAndDecQuantityInCart(type, id);
  }
}
