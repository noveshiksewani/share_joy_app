import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:share_joy/model/classes/products_model.dart';
import 'package:share_joy/model/services/product_filter.dart';
import 'package:share_joy/model/enums/enums.dart';

class ProductController extends ControllerMVC {

factory ProductController() => _this ??= ProductController._();
 ProductController._();
  static ProductController? _this;
  List<Product> _searchedItem = [];
  List<Product> get searchedItem => _searchedItem;
  set searchedItem(items) {
    _searchedItem = items;
  }

  bool _searchButtonCllicked = false;
  bool get searchButtonCllicked => _searchButtonCllicked;
  set searchButtonCllicked(click) {
    _searchButtonCllicked = click;
  }

  List<Product> filterProductCategory(ProductCategory name) {
    return ProductFilter.filterProductCategory(name);
  }

  List<Product> filterProductBySearch(String key) {
    return ProductFilter.filterProductBySearch(key);
  }

  Product getproductById(int id) {
    return ProductFilter.getproductById(id);
  }
}
