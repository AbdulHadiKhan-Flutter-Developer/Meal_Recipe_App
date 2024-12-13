import 'package:flutter/material.dart';

import '../models/home_category_mix_data_model.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'meal_detail_screen';
  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context)?.settings.arguments as String;
    final selectedmeal = EachMixModeldata.firstWhere(
        (EachMixModel) => EachMixModel.id == mealid);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        title: Text(
          '${selectedmeal.title} Recipe',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.pinkAccent,
              fontSize: 26),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.pinkAccent,
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedmeal.imageurl,
              fit: BoxFit.cover,
            ),
          ),
          mealtext('Ingredients'),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey, width: 2)),
            height: 100,
            width: 300,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                    color: Colors.amberAccent,
                    elevation: 5,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: Text(
                        selectedmeal.ingredients[index],
                        style: TextStyle(
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    ));
              },
              itemCount: selectedmeal.ingredients.length,
            ),
          ),
          mealtext('Steps'),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey, width: 2)),
            height: 150,
            width: 300,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.amberAccent,
                    child: Text(
                      '# ${index + 1}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent),
                    ),
                  ),
                  title: Text(
                    selectedmeal.steps[index],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              },
              itemCount: selectedmeal.steps.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amberAccent,
        child: Icon(
          isFavorite(mealid) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(mealid),
      ),
    );
  }
}

Widget mealtext(String text) {
  return Container(
    margin: EdgeInsets.all(10),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
