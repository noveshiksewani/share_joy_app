import 'package:flutter/material.dart';
import 'package:share_joy/view/widget/cart_products.dart';

class Basket extends StatefulWidget {
  const Basket({super.key});

  @override
  State<Basket> createState() => _BasketState();
}

class _BasketState extends State<Basket>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Center(
          child: Text("Review Basket", style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),),
        ),
        backgroundColor: Colors.blue.shade100,
        automaticallyImplyLeading: true,
        toolbarHeight: 60,
          iconTheme: IconThemeData(
    color: Theme.of(context).colorScheme.secondary, 
  ),
        bottom: TabBar(
          controller: _tabController,
          tabs:  <Widget>[
            Tab(
               height: 100,
              icon: Icon(Icons.shopping_cart, color: Theme.of(context).colorScheme.secondary, size:30),
               child: Padding(padding: const EdgeInsets.only(top: 6),child: Text("Cart", style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 15),)),
            ),
             Tab(
               height: 100,
              icon: Icon(Icons.favorite, color: Theme.of(context).colorScheme.secondary, size:28),
               child:  Padding(padding: const EdgeInsets.only(top: 9),child: Text("WishList", style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 15),)),
            ),
            Tab(
              height: 100,
              icon: Image.asset("assets/images/icon.webp", fit:BoxFit.contain, height: 40,width: 50,),
              child: Text("Gift Registry", style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 15),),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          CartProductList(screenType: "cart",),
           CartProductList(screenType: "wishList",),
            CartProductList(screenType: "giftRegistry",),
        ],
      ),
    );
  }
}
