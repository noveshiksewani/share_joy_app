import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_joy/controller/db_controller.dart';
import 'package:share_joy/model/classes/products_model.dart';
import 'package:share_joy/model/classes/basket_model.dart';
import 'package:share_joy/view/screens/product_detail.dart';

import '../widget/button.dart';

class CategoryDetail extends StatelessWidget {
  final String categoryName;
  final List<Product> product;
  final DBController _controller=DBController();
   CategoryDetail(
      {required this.categoryName, required this.product, super.key});
  @override
  Widget build(BuildContext context) {
    Widget body = product.isEmpty
        ? const Center(child: Text("Sorry no products"))
        : SingleChildScrollView(
            child: Column(children: [
            for (var items in product)
              InkWell(
                key: Key(items.name),
                onTap: () {
                  if (defaultTargetPlatform == TargetPlatform.iOS ||
                      defaultTargetPlatform == TargetPlatform.android) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  }
                  Navigator.of(context).push(MaterialPageRoute(
                     maintainState: true, 
                      builder: (ctx) => ProductDetail(product: items)));
                },
                splashColor: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  margin: const EdgeInsets.all(9),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(children: [
                    Hero(
                      tag: items.image,
                      child: Image.asset(
                        items.image,
                        fit: BoxFit.contain,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      items.name,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            wordSpacing: 2,
                            letterSpacing: 1,
                          ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(" Rs ${items.price}",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 15,
                            color: Theme.of(context).colorScheme.primary)),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonDesign(
                            type: 'icon',
                            name: "Add to cart",
                            callback: () async {
                              final result = await _controller.inserData(Cart(
                                  price: items.price,
                                  productId: items.id,
                                  productName: items.name,
                                  productImage: items.image,
                                  quantity: 1,
                                  type: "cart"));
                              if (!context.mounted) return;
                              if (defaultTargetPlatform == TargetPlatform.iOS ||
                                  defaultTargetPlatform ==
                                      TargetPlatform.android) {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                              
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                showCloseIcon: true,
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                content: SizedBox(
                                    height: 25,
                                    child: Text(
                                      !result
                                          ? 'Sorry, Could not add the data. Please Try Again!'
                                          : 'Added to your cart',
                                      style: const TextStyle(fontSize: 17),
                                    )),
                                duration: const Duration(seconds: 3),
                              ));
                                      }
                            },

                            icon: Icon(
                              Icons.shopping_cart,
                              color: Theme.of(context).colorScheme.primary,
                            )),
                       if(defaultTargetPlatform==TargetPlatform.iOS|| defaultTargetPlatform==TargetPlatform.android)
                        const Spacer(),
                        if(defaultTargetPlatform!=TargetPlatform.iOS&& defaultTargetPlatform!=TargetPlatform.android)
                        const SizedBox(width: 10,),
                        ButtonDesign(
                            type: 'icon',
                            name: "Add to Wish List",
                            callback: () async {
                              final result = await _controller.inserData(Cart(
                                  price: items.price,
                                  productId: items.id,
                                  productName: items.name,
                                  productImage: items.image,
                                  quantity: 1,
                                  type: "wishList"));
                              if (!context.mounted) return;
                              if (defaultTargetPlatform == TargetPlatform.iOS ||
                                  defaultTargetPlatform ==
                                      TargetPlatform.android) {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                              
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                showCloseIcon: true,
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                content: SizedBox(
                                    height: 25,
                                    child: Text(
                                      !result
                                          ? 'Sorry, Could not add the data. Please Try Again!'
                                          : 'Added to your wishlist',
                                      style: const TextStyle(fontSize: 17),
                                    )),
                                duration: const Duration(seconds: 3),
                              ));
                                      }
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: Theme.of(context).colorScheme.primary,
                            )),
                      ],
                    )
                  ]),
                ),
              )
          ]));

    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 70,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                Navigator.of(context).pop();
              },
            ),
            iconTheme: IconThemeData(
              color: Theme.of(context).colorScheme.secondary,
            ),
            backgroundColor: Colors.blue.shade100,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(categoryName.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 17,
                        letterSpacing: 3,
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 20,
                ),
                //const Spacer(),
                Image.asset("assets/images/icon.webp", width: 70, height: 70)
              ],
            )),
        body: body);
  }
}
