import 'package:flutter/material.dart';
import 'package:share_joy/controller/product_controller.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({super.key});

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
final ProductController _productController = ProductController();
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    _productController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
         toolbarHeight: 80,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,  color: Theme.of(context).colorScheme.secondary,),
          onPressed: () {
            setState(() {
              FocusScope.of(context).unfocus();
            });
             Navigator.of(context).pop();
          },
        ),
        title:  Text("Search",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 17,
                        letterSpacing: 3,
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(children: [
        Container(
          margin: const EdgeInsets.only(left: 10, top: 20),
          padding: const EdgeInsets.only(left: 10, top: 8, bottom: 8),
          height: 80,
          width: MediaQuery.of(context).size.width * 0.93,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    labelText: 'Type to search product',
                    labelStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              //Spacer(),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    _productController.searchButtonCllicked = true;
                    FocusScope.of(context).unfocus();
                    _productController.searchedItem =
                        _productController.filterProductBySearch(_controller.text);
                  });
                },
              )
            ],
          ),
        ),
        if (_productController.searchButtonCllicked && _productController.searchedItem.isNotEmpty)
         Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 3, top: 8, bottom: 8, right: 3),
                width: double.infinity,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      textColor: Colors.black,
                      leading: Image.asset(_productController.searchedItem[index].image, width: 90, height: 90, fit: BoxFit.cover,),
                      title: Text(_productController.searchedItem[index].name),
                      subtitle: Text("Rs ${_productController.searchedItem[index].price}"),
                     
                    );
                  },
                  itemCount: _productController.searchedItem.length,
                ),
              ),
           // ),
          ),
        if (_productController.searchButtonCllicked && _productController.searchedItem.isEmpty)
           Expanded(child:  Center(child: Text("No result found", style:
          Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ))),
      ]),
    );
  }
}
