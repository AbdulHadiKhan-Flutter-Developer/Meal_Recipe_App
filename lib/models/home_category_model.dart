import 'package:flutter/material.dart';

class HomeCategoryModel {
  final String id;
  final String title;
  final Color color;

  const HomeCategoryModel(
      {required this.id, required this.title, this.color = Colors.black});
}
