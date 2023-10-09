import 'package:flutter/material.dart';
import 'package:share_joy/controller/db_controller.dart';
import 'package:share_joy/controller/product_controller.dart';
import 'package:share_joy/view/screens/product_detail.dart';
import 'package:share_joy/view/widget/counter_button.dart';

class CartProductList extends StatefulWidget {
  final String screenType;
  const CartProductList({super.key, required this.screenType});
  @override
  State<CartProductList> createState() => CartProductListState();
}

class CartProductListState extends State<CartProductList> {
  final DBController _controller=DBController();
   final ProductController _productController = ProductController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.loadBasket(widget.screenType),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text("Oh no something went wrong. Please try again"),
          );
        }
        if (snapshot.hasData) {
          if (snapshot.data!.cart.isEmpty) {
            return Center(
              child: Text(
                "Empty basket",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            );
          }

          return SizedBox(
            height: 600,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.screenType == "cart" &&
                    snapshot.data!.subTotal > 0.0)
                  Container(
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 10, left: 15),
                    child: Text(
                      "SubTotal Rs ${snapshot.data!.subTotal}",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                if(widget.screenType=="giftRegistry")
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15) 
                      ),
                      padding:const EdgeInsets.all(10),
                      child: ElevatedButton.icon(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>( Colors.pink.shade100)),
                        onPressed: (){
                       showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return const Wrap(
                          children: [
                            ListTile(
                              leading: Icon(Icons.chat,color: Colors.green,size: 30,),
                              title: Text('Whatsapp',style: TextStyle(fontSize: 20)),
                            ),
                            ListTile(
                              leading: Icon(Icons.message,color:Colors.blueAccent,size: 30,),
                              title: Text('Message',style: TextStyle(fontSize: 20)),
                            ),
                            ListTile(
                              leading: Icon(Icons.mail, color: Colors.purple,size: 30,),
                              title: Text('Mail',style: TextStyle(fontSize: 20)),
                            ),
                          ],
                        );
                      });
                      }, icon: const Icon(Icons.share,color: Colors.black,),
                      label: const Text("Share the gift registry",style: TextStyle(fontSize: 16,letterSpacing: 1,wordSpacing: 1,color: Colors.black54,),),
                    ),
                    ),
                  ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (ctx, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              maintainState: true, 
                                builder: (ctx) => ProductDetail(
                                      product: _productController.getproductById(
                                          snapshot.data!.cart[index].productId),
                                    )));
                          },
                          child: Container(
                            color: Colors.grey.shade200,
                            height: 120,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    width: 100,
                                    padding: const EdgeInsets.all(8),
                                    child: Image.asset(
                                      snapshot.data!.cart[index].productImage,
                                      fit: BoxFit.fill,
                                    )),
                                SizedBox(
                                    height: 150,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              padding: const EdgeInsets.only(
                                                  top: 8, bottom: 8, left: 10),
                                              width: 280,
                                              child: Text(
                                                snapshot.data!.cart[index]
                                                    .productName,
                                                maxLines: 2,
                                                overflow: TextOverflow.fade,
                                                softWrap: true,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              )),
                                          SizedBox(
                                            width: 280,
                                            child: Row(children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8,
                                                          bottom: 8,
                                                          left: 10),
                                                  child: Text(
                                                      "Rs ${snapshot.data!.cart[index].price}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              fontSize: 15,
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .primary))),
                                              const Spacer(),
                                              IconButton(
                                                  onPressed: () async {
                                                    final result =
                                                        await _controller
                                                            .deleteDataById(
                                                                snapshot
                                                                    .data!
                                                                    .cart[index]
                                                                    .id,snapshot.data!.cart[index].type);
                                                    if (result) {
                                                      setState(() {});
                                                    }
                                                    if (!result) {
                                                      setState(() {});
                                                    }
                                                  },
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                  )),
                                              if (widget.screenType == "cart")
                                                CounterButton(
                                                    callback: (check) {
                                                      setState(() {});
                                                    },
                                                    cart: snapshot
                                                        .data!.cart[index])
                                            ]),
                                          ),
                                        ])),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                          child: Divider(
                            height: 3,
                            thickness: 1,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        );
                      },
                      itemCount: snapshot.data!.cart.length),
                ),
              
              ],
            ),
          );
        }
        return const Center(
          child: Text("No Data"),
        );
      },
    );
  }
}
