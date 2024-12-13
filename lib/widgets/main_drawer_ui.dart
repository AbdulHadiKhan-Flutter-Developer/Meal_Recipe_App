import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodfiesta/screens/filter_screen.dart';

class MainDrawerUi extends StatelessWidget {
  const MainDrawerUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            height: 120,
            width: double.infinity,
            color: Colors.amberAccent,
            child: Text(
              'FoodFista!',
              style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 58,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}

Widget buildListTile(String title, IconData icon, VoidCallback taphandler) {
  return ListTile(
    leading: Icon(
      icon,
      size: 26,
    ),
    title: Text(
      title,
      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
    ),
    onTap: taphandler,
  );
}
