import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:share_joy/model/classes/categories_model.dart';
import 'package:share_joy/model/classes/products_model.dart';
import 'package:share_joy/model/constants/constant.dart';
import 'package:share_joy/model/services/screen_type.dart';

class ScreenController extends ControllerMVC {
  
factory ScreenController() => _this ??= ScreenController._();
 ScreenController._();
  static ScreenController? _this;

   String  _currentScreen="home";
    String get currentScreen=>_currentScreen;
    set currentScreen(name)
    {
     _currentScreen=name;
    }

    List<String> get imageList => Constants.imageList;
    Set<Categories> get categoryList => Constants.categoryList;
    Set<Product> get productList => Constants.productList;
    Widget currentWidget(String type){
    return ScreenType.currentWidget(type);
  }

}
