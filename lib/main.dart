import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screen/categories_screen.dart';
import 'package:meals_app/screen/category_meals_screen.dart';
import 'package:meals_app/screen/filter_screen.dart';
import 'package:meals_app/screen/meal_detail_screen.dart';
import 'package:meals_app/screen/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _existingFavourites = [];
  List<Meal> _avaliableMeals = DUMMY_MEALS;

  Map<String, bool> _filters = {
    'gluten-free': false,
    'lactose-free': false,
    'vegetarian': false,
    'vegan': false,
  };

  void _toggleFavs(String id) {
    var index = _existingFavourites.indexWhere((meal) => meal.id == id);
    if (index >= 0) {
      _existingFavourites.removeAt(index);
    } else {
      _existingFavourites.add(DUMMY_MEALS.firstWhere((meal) => meal.id == id));
    }
  }

  bool _isFav(String id) {
    return _existingFavourites.any((element) => element.id == id)
        ? true
        : false;
  }

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _avaliableMeals = DUMMY_MEALS.where(
        (meal) {
          if (_filters['gluten-free'] && !meal.isGlutenFree) {
            return false;
          }
          if (_filters['lactose-free'] && !meal.isLactoseFree) {
            return false;
          }
          if (_filters['vegetarian'] && !meal.isVegetarian) {
            return false;
          }
          if (_filters['vegan'] && !meal.isVegan) {
            return false;
          }
          return true;
        },
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(
              existingFavs: _existingFavourites,
            ),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_avaliableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggleFavs, _isFav),
        FilterScreen.routeName: (ctx) => FilterScreen(_filters, _setFilters),
      },
      // onUnknownRoute: (settings) =>
      //     MaterialPageRoute(builder: (ctx) => CategoriesScreen()),
    );
  }
}
