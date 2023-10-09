import 'package:flutter/material.dart';
import 'package:share_joy/controller/product_controller.dart';
import 'package:share_joy/model/enums/enums.dart';
import 'package:share_joy/view/screens/category_detail.dart';

class CategoryGridItem extends StatelessWidget {
  final ProductCategory categoryName;
  final String image;
   CategoryGridItem(
      {super.key, required this.categoryName, required this.image});
  final ProductController _controller = ProductController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Opacity(
            opacity: 1,
            alwaysIncludeSemantics: true,
            child: InkWell(
              onTap: () {
                final productCategoryList =
                    _controller.filterProductCategory(categoryName);
                productCategoryList.shuffle();
                Navigator.of(context).push(MaterialPageRoute(
                  maintainState: true, 
                    builder: (ctx) => CategoryDetail(
                          categoryName: categoryName.name,
                          product: productCategoryList,
                        )));
              },
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width / 2 * 0.9,
                  height: 300,
                ),
              ),
            ),
          ),
        ),
        Text(
          categoryName.name.toUpperCase(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        )
      ],
    );
  }
}
