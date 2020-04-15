import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  List<Meal> existingFavs;
  FavouritesScreen(this.existingFavs);
  @override
  Widget build(BuildContext context) {
    if (existingFavs.isEmpty) {
      return Center(
        child: Text("You don't have any favourites at this moment!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (cxt, index) {
          return MealItem(
            id: existingFavs[index].id,
            title: existingFavs[index].title,
            affordability: existingFavs[index].affordability,
            imageUrl: existingFavs[index].imageUrl,
            duration: existingFavs[index].duration,
            complexity: existingFavs[index].complexity,
            // removeItem: _removeItem,
          );
        },
        itemCount: existingFavs.length,
      );
    }
  }
}
