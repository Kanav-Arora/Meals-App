import 'package:flutter/material.dart';
import 'package:meal_app/Data/dummy_data.dart';
import 'package:meal_app/Widgets/meal_item.dart';
import 'package:meal_app/Data/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = "CategoryMealsScreen";
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryMeals = availableMeals.where((element) {
      return element.categories.contains(routeArgs['id']);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(routeArgs['title']),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        ),
        body: ListView.builder(
          key: UniqueKey(),
          itemBuilder: ((context, index) {
            return MealItem(categoryMeals[index]);
          }),
          itemCount: categoryMeals.length,
        ));
  }
}
