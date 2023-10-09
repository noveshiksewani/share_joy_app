import 'package:flutter/material.dart';
import 'package:share_joy/view/screens/basket.dart';
import 'package:share_joy/view/screens/home.dart';

class ScreenType {

   static Widget currentWidget(String type){
    switch (type){
      case "home":
        return const MyHomePage();
      case "registry" :
       return const Center(child: Text("Hello"),);
      case "cart" :
       return const Basket(); 
      default: 
     return const Center(child: Text("No Page Found"),);
    }
  }
  
}
