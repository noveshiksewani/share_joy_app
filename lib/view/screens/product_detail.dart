import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_joy/controller/db_controller.dart';
import 'package:share_joy/model/classes/basket_model.dart';
import 'package:share_joy/model/classes/products_model.dart';
import 'package:share_joy/view/screens/basket.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
   ProductDetail({super.key, required this.product});
 final DBController _controller=DBController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        actions:  [
          Padding(
            padding:const EdgeInsets.all(7.0),
            child: IconButton(icon:const Icon(Icons.shopping_cart),onPressed: (){
               if(defaultTargetPlatform==TargetPlatform.iOS|| defaultTargetPlatform==TargetPlatform.android)
                              {ScaffoldMessenger.of(context).hideCurrentSnackBar();}
               Navigator.of(context).push(MaterialPageRoute(
                 maintainState: true, 
                                builder: (ctx) => const Basket()));
            },),
          )
        ],
        actionsIconTheme: const IconThemeData(size: 40),
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 20),
          Hero(
            tag: product.image,
            child: Image.asset(
              product.image,
              height:  MediaQuery.of(context).size.height*0.5,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            product.name,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          const SizedBox(height: 14),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
            ),
            padding: const EdgeInsets.only(
                top: 10.0, left: 15, right: 15, bottom: 10),
            child: Column(
              children: [
                Text(
                  "Description: ",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  product.description,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        wordSpacing: 2,
                        fontSize: 16,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          ElevatedButton.icon(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                )),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blue.shade50),
              ),
              onPressed: () async {
                final result = 
                 await _controller.inserData(Cart(
                    price: product.price,
                    productId: product.id,
                    productName: product.name,
                    productImage: product.image,
                    quantity: 1,
                    type: "giftRegistry"));
                     if (!context.mounted) return;
                     if(defaultTargetPlatform==TargetPlatform.iOS|| defaultTargetPlatform==TargetPlatform.android)
                              {ScaffoldMessenger.of(context).hideCurrentSnackBar();
                              ScaffoldMessenger.of(context)
                                    .showSnackBar( SnackBar(
                                      showCloseIcon: true,
                                      backgroundColor: Theme.of(context).colorScheme.primary,
                                content:  SizedBox( height: 25,child: Text(!result?'Sorry, Could not add the data. Please Try Again!':'Added to your gift registry', style:const  TextStyle(fontSize: 17),)),
                                  duration:  const Duration(seconds: 3),
                                ));
                              }
              },
              icon:
                  Image.asset("assets/images/icon.webp", width: 60, height: 60),
              label: Text(
                "Add to Gift Registry",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              )),
          const SizedBox(height: 14)
        ]),
      ),
    );
  }
}
