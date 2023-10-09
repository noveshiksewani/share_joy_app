import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_joy/controller/screen_controller.dart';
import 'package:share_joy/view/widget/category_grid_items.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});
  @override
  State<CategoryList> createState() => CategoryListState();
}

class CategoryListState extends State<CategoryList> {
  final ScreenController _controller = ScreenController();
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (defaultTargetPlatform == TargetPlatform.iOS ||
                defaultTargetPlatform == TargetPlatform.android)
            ? 2
            : 3,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      children: [
        for (var items in _controller.categoryList)
          CategoryGridItem(
            key: Key(items.categoryName.name),
            categoryName: items.categoryName,
            image: items.categoryImage,
          )
      ],
    );
  }
}
