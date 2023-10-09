import 'package:flutter/foundation.dart';
import 'package:share_joy/model/classes/basket_model.dart';
import 'package:share_joy/model/services/cache_setup.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart' as path;

class DBFunction {
  static Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  
  //await deleteDatabase(path.join(dbPath, 'user.db'));
  final db = await sql.openDatabase(path.join(dbPath, 'user.db'),
      onCreate: (db, version) {
    return db.execute(
        'Create table cart(id TEXT Primary Key,productId INTEGER, productName Text, productImage TEXT, price TEXT, type Text, quantity INTEGER)');
  }, version: 1);
  return db;
}
  static Future<BasketItems> loadBasket(String type) async {
   if(defaultTargetPlatform==TargetPlatform.iOS|| defaultTargetPlatform==TargetPlatform.android)
   {
    try {
      final db = await _getDatabase();
      final data = await db.query('cart', where: 'type=?', whereArgs: [type]);
      double subTotal =0;
      db.close();
      List<Cart> result=[];
      for(var row in data)
      {
         subTotal=subTotal+(double.tryParse(row['price'] as String)??0.0)*(row['quantity'] as int);
          result.add ( Cart(
              id: row['id'] as String,
              productId: row['productId'] as int,
              price: row['price'] as String,
              quantity: row['quantity'] as int,
              productName: row['productName'] as String,
              type: row['type'] as String,
              productImage: row['productImage'] as String));

      }
       return BasketItems(cart:result,subTotal: subTotal);
          
    } catch (exception) {
      return BasketItems(cart:[],subTotal: 0);
    }
   }
   else
   {
    return CacheData.loadBasket(type);
   }
  }
  static Future<bool> inserData(Cart cart) async {
    if(defaultTargetPlatform==TargetPlatform.iOS|| defaultTargetPlatform==TargetPlatform.android){ try {
      final db = await _getDatabase();
      final data = await db.query('cart',
          where: 'type=? AND productId=?',
          whereArgs: [cart.type, cart.productId]);
      final result = data
          .map((row) => Cart(
              id: row['id'] as String,
              productId: row['productId'] as int,
              price: row['price'] as String,
              quantity: row['quantity'] as int,
              productName: row['productName'] as String,
              type: row['type'] as String,
              productImage: row['productImage'] as String))
          .toList();
      if (result.isEmpty) {
        var values = {
          'productId': cart.productId,
          'id': cart.id,
          'price': cart.price,
          'quantity': cart.quantity,
          'productName': cart.productName,
          'type': cart.type,
          'productImage': cart.productImage,
        };
        await db.insert("cart", values);
      } else if (result.isNotEmpty && cart.type == "cart") {
        await db.update(
            "cart", {'quantity': result[0].quantity + cart.quantity},
            where: 'id=?', whereArgs: [result[0].id]);
      }
      db.close();
      return true;
    } catch (exception) {
      return false;
    }
    }
    else{
      return CacheData.inserData(cart);
    }
  }
  static Future<bool> deleteDataById(String id,String type ) async {
    if(defaultTargetPlatform==TargetPlatform.iOS|| defaultTargetPlatform==TargetPlatform.android) {try {
      final db = await _getDatabase();
      int count = await db.delete("cart", where: 'id=?', whereArgs: [id]);
      if (count > 0) {
        return true;
      }
      return false;
    } catch (ex) {
      return false;
    }}
    else{
      return CacheData.deleteDataById(id, type);
    }
  }
  static Future<bool> deleteAllItems(String type) async {
    try {
      final db = await _getDatabase();
      await db.delete("cart", where: 'type=?', whereArgs: [type]);
      return true;
    } catch (ex) {
      return false;
    }
  }
  static Future<bool> incAndDecQuantityInCart(String type, String id) async {
   if(defaultTargetPlatform==TargetPlatform.iOS|| defaultTargetPlatform==TargetPlatform.android) { try {
      final db = await _getDatabase();
      final data = await db.query('cart', where: 'id=?', whereArgs: [id]);
      final result = data
          .map((row) => Cart(
              id: row['id'] as String,
              productId: row['productId'] as int,
              price: row['price'] as String,
              quantity: row['quantity'] as int,
              productName: row['productName'] as String,
              type: row['type'] as String,
              productImage: row['productImage'] as String))
          .toList();
      if (result.isEmpty) {
        return false;
      }
      if (type == "increase") {
        await db.update("cart", {'quantity': result[0].quantity + 1},
            where: 'id=?', whereArgs: [result[0].id]);
      }
      if (type == "decrease" && result[0].quantity >= 2) {
        await db.update("cart", {'quantity': result[0].quantity - 1},
            where: 'id=?', whereArgs: [result[0].id]);
      }
      return true;
    } catch (ex) {
      return false;
    }}
    else{
       return CacheData.incAndDecQuantityInCart(type, id);
    }
  }
}
