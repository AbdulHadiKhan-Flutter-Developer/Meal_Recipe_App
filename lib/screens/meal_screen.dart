import 'package:flutter/material.dart';

import 'package:foodfiesta/models/meal_model.dart';
import 'package:foodfiesta/widgets/meal_screen_ui.dart';

class EachMixScreen extends StatefulWidget {
  static const routeName = 'meal_screen';
  final List<EachMixModel> availablemeals;
  EachMixScreen(this.availablemeals);

  @override
  State<EachMixScreen> createState() => _EachMixScreenState();
}

class _EachMixScreenState extends State<EachMixScreen> {
  @override
  Widget build(BuildContext context) {
    // Safely cast the arguments as Map<String, Object>
    final routeAurg =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>?;

    // Safely access and cast the values to String (or provide default values if null)
    final categoryTitle = routeAurg?['title'] as String? ??
        'Default Title'; // Default value if null
    final categoryId =
        routeAurg?['id'] as String? ?? ''; // Default empty string if null

    // Filter the EachMixModeldata based on the categoryId
    final EachMixMeals = widget.availablemeals.where((EachMixModel) {
      return EachMixModel.categoriesid.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        title: Text(
          categoryTitle, // categoryTitle is non-null due to fallback value
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.pinkAccent,
              fontSize: 26),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return EachMicScreenUi(
              id: EachMixMeals[index].id,
              title: EachMixMeals[index].title,
              imageurl: EachMixMeals[index].imageurl,
              duration: EachMixMeals[index].duration,
              complaxity: EachMixMeals[index].complaxity,
              affordability: EachMixMeals[index].affordability,
            );
          },
          itemCount: EachMixMeals.length,
        ),
      ),
    );
  }
}
