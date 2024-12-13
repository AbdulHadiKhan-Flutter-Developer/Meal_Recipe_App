import 'package:flutter/material.dart';
import 'package:foodfiesta/models/meal_model.dart';
import 'package:foodfiesta/widgets/meal_screen_ui.dart';

class FavoritesScreen extends StatefulWidget {
  final List<EachMixModel> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return EachMicScreenUi(
            id: widget.favoriteMeals[index].id,
            title: widget.favoriteMeals[index].title,
            imageurl: widget.favoriteMeals[index].imageurl,
            duration: widget.favoriteMeals[index].duration,
            affordability: widget.favoriteMeals[index].affordability,
            complaxity: widget.favoriteMeals[index].complaxity,
          );
        },
        itemCount: widget.favoriteMeals.length,
      );
    }
  }
}
