import 'package:flutter/material.dart';
import 'package:meal_app/Data/meal.dart';
import 'package:meal_app/Screen/categories_screen.dart';
import 'package:meal_app/Screen/favourites_screen.dart';
import 'package:meal_app/Widgets/main_drawer.dart';

class TabsBottomScreen extends StatefulWidget {
  List<Meal> favouriteList;
  TabsBottomScreen(this.favouriteList);
  @override
  State<TabsBottomScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabsBottomScreen> {
  List<Map<String, Object>> _pageList;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pageList = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavouritesScreen(widget.favouriteList), 'title': 'Favourites'},
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageList[_selectedPageIndex]['title']),
      ),
      body: _pageList[_selectedPageIndex]['page'],
      drawer: Drawer(
        child: MainDrawer(),
        width: size.width / 1.9,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), label: 'Favourites'),
        ],
      ),
    );
  }
}
