import 'package:flutter/material.dart';
import 'package:foodfiesta/screens/meal_screen.dart';

class HomeCategoryUi extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  HomeCategoryUi(this.id, this.title, this.color);
  void onTap(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(EachMixScreen.routeName,
        arguments: {'id': id, 'title': title, 'color': color});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(context),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
