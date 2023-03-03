import 'package:flutter/material.dart';
import 'package:meal_app/Data/meal.dart';
import 'package:meal_app/Widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  static String routeName = "FavouriteScreen";
  List<Meal> data;

  FavouritesScreen(this.data);
  @override
  Widget build(BuildContext context) {
    return data.length == 0
        ? Center(
            child: Text(
            'No Favourites - Add your favourite meals',
            style: Theme.of(context).textTheme.titleMedium,
          ))
        : ListView.builder(
            key: UniqueKey(),
            itemBuilder: ((context, index) {
              return MealItem(data[index]);
            }),
            itemCount: data.length,
          );
  }
}
