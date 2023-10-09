import 'package:flutter/material.dart';
import 'package:share_joy/controller/screen_controller.dart';
import 'package:share_joy/view/screens/search_product.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final ScreenController _controller = ScreenController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
     extendBody: true,
      extendBodyBehindAppBar: true,
      floatingActionButton: SizedBox(
        height: 50,
        width: 50,
      child: FloatingActionButton(
          elevation: 10,
           focusColor:Colors.pinkAccent,
          backgroundColor:Theme.of(context).colorScheme.onPrimary,
          onPressed: () {
           Navigator.of(context).push(MaterialPageRoute(maintainState: true,builder:(ctx)=>  const SearchProduct()));
          },
        child:  Stack(children: [
          Container(decoration: const BoxDecoration(
            shape:BoxShape.circle,color: Colors.transparent
          ),
          ),
           const Positioned.fill(child: Center(
              child:Icon(Icons.search, color:Colors.black),)
            )
        ]
        ),
      ),),
      bottomNavigationBar:BottomAppBar(
        height: MediaQuery.of(context).size.height*0.13,
        notchMargin: 7,
      shape: const CircularNotchedRectangle(),
      color: Theme.of(context).colorScheme.primary,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
               onTap: (){
                 setState(() {
                       _controller.currentScreen="home";
                      });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Icon(_controller.currentScreen=="home"?Icons.home:Icons.home_outlined,size: 35,),
                   ),
                  Text("Home",style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: 20,
                    color: Colors.white
                  ),)
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                     setState(() {
                      _controller.currentScreen="cart";
                      });
                    },
              child: Column(
                children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Icon(_controller.currentScreen=="cart"?Icons.shopping_cart:Icons.shopping_cart_outlined,size: 35,),
                   ),
                  Text("Cart",style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: 20,
                    color: Colors.white
                  ),)
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    body:  _controller.currentWidget(_controller.currentScreen),
    );
  }
  

}
