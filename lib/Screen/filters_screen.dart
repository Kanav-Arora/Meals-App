import 'package:flutter/material.dart';
import 'package:meal_app/Widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static String routeName = 'FiltersScreen';
  final Map<String, bool> currentFilters;
  final Function filters;
  FiltersScreen(this.currentFilters, this.filters);
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _veg = false;
  var _vegan = false;
  var _lactose = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['glutenFree'];
    _veg = widget.currentFilters['veg'];
    _vegan = widget.currentFilters['vegan'];
    _lactose = widget.currentFilters['lactose'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: Drawer(
        child: MainDrawer(),
        width: size.width / 1.9,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selections.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                title: Text('Gluten Free'),
                subtitle: Text('Only include Gluten-Free meals.'),
                value: _glutenFree,
                onChanged: (value) {
                  setState(() {
                    _glutenFree = value;
                    final mp_data = {
                      'glutenFree': _glutenFree,
                      'veg': _veg,
                      'vegan': _vegan,
                      'lactose': _lactose,
                    };
                    widget.filters(mp_data);
                  });
                },
              ),
              SwitchListTile(
                title: Text('Only Veg'),
                subtitle: Text('Only include vegetarian meals.'),
                value: _veg,
                onChanged: (value) {
                  setState(() {
                    _veg = value;
                    final mp_data = {
                      'glutenFree': _glutenFree,
                      'veg': _veg,
                      'vegan': _vegan,
                      'lactose': _lactose,
                    };
                    widget.filters(mp_data);
                  });
                },
              ),
              SwitchListTile(
                title: Text('Vegan'),
                subtitle: Text('Only include vegan meals.'),
                value: _vegan,
                onChanged: (value) {
                  setState(() {
                    _vegan = value;
                    final mp_data = {
                      'glutenFree': _glutenFree,
                      'veg': _veg,
                      'vegan': _vegan,
                      'lactose': _lactose,
                    };
                    widget.filters(mp_data);
                  });
                },
              ),
              SwitchListTile(
                title: Text('Lactose Free'),
                subtitle: Text('Only include Lactose-Free meals.'),
                value: _lactose,
                onChanged: (value) {
                  setState(() {
                    _lactose = value;
                    final mp_data = {
                      'glutenFree': _glutenFree,
                      'veg': _veg,
                      'vegan': _vegan,
                      'lactose': _lactose,
                    };
                    widget.filters(mp_data);
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
