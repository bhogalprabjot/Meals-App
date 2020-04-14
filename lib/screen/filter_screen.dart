import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = 'filter-screen';
  Function _saveFilters;
  Map<String, bool> _filters;

  FilterScreen(this._filters, this._saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _isGlutenFree = false;
  var _isVegan = false;
  var _isVegetarian = false;
  var _isLactoseFree = false;

  @override
  initState() {
    _isGlutenFree = widget._filters['gluten-free'];
    _isVegan = widget._filters['vegan'];
    _isLactoseFree = widget._filters['lactose-free'];
    _isVegetarian = widget._filters['vegetarian'];

    super.initState();
  }

  Widget _buildSwitchedListTile(
      bool currentValue, String title, String subTitle, Function changeValue) {
    return SwitchListTile(
      value: currentValue,
      title: Text(title),
      subtitle: Text(subTitle),
      onChanged: changeValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filters",
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten-free': _isGlutenFree,
                  'lactose-free': _isLactoseFree,
                  'vegetarian': _isVegetarian,
                  'vegan': _isVegan,                  
                };
                widget._saveFilters(selectedFilters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Adjust your meal section",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchedListTile(
                  _isGlutenFree,
                  "Gluten-Free",
                  "Only include gluten-free meals",
                  (newValue) {
                    setState(() {
                      _isGlutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchedListTile(
                  _isVegan,
                  "Vegan",
                  "Only include Vegan meals",
                  (newValue) {
                    setState(() {
                      _isVegan = newValue;
                    });
                  },
                ),
                _buildSwitchedListTile(
                  _isVegetarian,
                  "Vegetarian",
                  "Only include vegetarian meals",
                  (newValue) {
                    setState(() {
                      _isVegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchedListTile(
                  _isLactoseFree,
                  "Lactose-Free",
                  "Only include lactos-free meals",
                  (newValue) {
                    setState(() {
                      _isLactoseFree = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
