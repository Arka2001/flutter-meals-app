import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_tile_widget.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.favoriteMeals.isNotEmpty
        ? ListView.builder(
            itemCount: widget.favoriteMeals.length,
            itemBuilder: (context, index) {
              Meal item = widget.favoriteMeals[index];
              return MealTile(
                  id: item.id,
                  imageUrl: item.imageUrl,
                  title: item.title,
                  duration: item.duration,
                  affordability: item.affordability,
                  complexity: item.complexity);
            },
          )
        : Center(
            child: Text(
              "You don't have any Favorites yet. Add some Now!",
            ),
          );
  }
}
