import 'package:flutter/material.dart';
import 'package:meal_app/Data/dummy_data.dart';
import 'package:meal_app/Screen/categories_screen.dart';
import 'package:meal_app/Screen/category_meals_screen.dart';
import 'package:meal_app/Screen/filters_screen.dart';
import 'package:meal_app/Screen/meal_detail_sceen.dart';
import 'package:meal_app/Screen/tabs_bottom_screen.dart';
import 'package:meal_app/Data/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'glutenFree': false,
    'veg': false,
    'vegan': false,
    'lactose': false
  };

  List<Meal> _availableMeal = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;

      _availableMeal = DUMMY_MEALS.where((element) {
        if (filters['glutenFree'] && !element.isGlutenFree) return false;
        if (filters['veg'] && !element.isVegetarian) return false;
        if (filters['vegan'] && !element.isVegan) return false;
        if (filters['lactose'] && !element.isLactoseFree) return false;
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Raleway',
        textTheme: const TextTheme(
          titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      darkTheme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.purple),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(
            0xFF000000,
          ),
        ),
        brightness: Brightness.light,
        fontFamily: 'Raleway',
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsBottomScreen(),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeal),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(filters, _setFilters),
      },
      onGenerateRoute: (settings) {
        // if named route doesn't exists in route table
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(),
        );
      },
      onUnknownRoute: (settings) {
        // route is unable to be shown on screen
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(),
        );
      },
    );
  }
}
