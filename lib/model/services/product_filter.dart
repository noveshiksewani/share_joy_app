import 'package:share_joy/model/constants/constant.dart';
import 'package:share_joy/model/enums/enums.dart';
import 'package:share_joy/model/classes/products_model.dart';

class ProductFilter {
  static List<Product> filterProductCategory(ProductCategory name) {
    final List<Product> result = [];
    for (var items in Constants.productList) {
      if (items.productType == name) {
        result.add(items);
      }
    }
    return result;
  }

  static List<Product> filterProductBySearch(String key) {
    final List<Product> result = [];
    for (var items in Constants.productList) {
      if (items.name.toLowerCase().contains(key.toLowerCase()) ||
          items.description.toLowerCase().contains(key.toLowerCase())) {
        result.add(items);
      }
    }
    return result;
  }

  static Product getproductById(int id) {
     final product=Constants.productList.where((e) =>e.id==id ).first;
    return product;
  }
}
