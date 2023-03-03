import 'package:flutter/material.dart';
import 'package:meal_app/Widgets/category_item.dart';
import '../Data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(15),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES
          .map((e) => (CategoryItem(
                id: e.id,
                title: e.title,
                color: e.color,
              )))
          .toList(),
    );
  }
}
