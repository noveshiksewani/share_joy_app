import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_joy/model/constants/constant.dart';
import 'package:share_joy/view/widget/category_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end:   Offset( (defaultTargetPlatform==TargetPlatform.iOS|| defaultTargetPlatform==TargetPlatform.android)?0.5:10, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.linearToEaseOut,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "ShareJoy Registry",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        wordSpacing: 2,
                        letterSpacing: 1,
                       // fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                 const SizedBox(height: 5,),
                  Text(
                    "Unbox Joy With Every Order",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          wordSpacing: 2,
                          letterSpacing: 1,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 207, 39, 64),
                        ),
                  )
                ],
              ),
              SlideTransition(
                  position: _offsetAnimation,
                  child: Image.asset("assets/images/icon.webp",
                      width: 80, height: 80)),
            ]),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.grey.shade100,
              padding: const EdgeInsets.all(7),
              child: CarouselSlider(
                options: CarouselOptions(
                    height: (defaultTargetPlatform==TargetPlatform.iOS|| defaultTargetPlatform==TargetPlatform.android)? MediaQuery.of(context).size.height*0.3: MediaQuery.of(context).size.height*0.5,//200,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    autoPlayAnimationDuration: const Duration(microseconds: 100),
                    autoPlayCurve: Curves.elasticIn),
                items: Constants.imageList.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width * 0.8,//0.8
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 5.0),
                          child: Image.asset(
                            i,
                            //width: 400, //500
                            height: 400,
                            fit: (defaultTargetPlatform==TargetPlatform.iOS|| defaultTargetPlatform==TargetPlatform.android)?BoxFit.fill: BoxFit.cover,
                          ));
                    },
                  );
                }).toList(),
              ),
            ),
            
            Text(
              "Categories",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 20),
            ),
              const SizedBox(
              height: 800,
                child: CategoryList(),
              ),
            //)
          ]),
        ),
      ),
    );
  }
}
