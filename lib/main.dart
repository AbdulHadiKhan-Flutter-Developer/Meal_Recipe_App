import 'package:flutter/material.dart';
import 'package:foodfiesta/models/meal_model.dart';
import 'package:foodfiesta/screens/filter_screen.dart';
import 'package:foodfiesta/screens/meal_detail_screen.dart';
import 'package:foodfiesta/screens/meal_screen.dart';
import '../screens/tabs_screen.dart';
import './models/home_category_mix_data_model.dart';

void main() => runApp(FoodFiesta());

class FoodFiesta extends StatefulWidget {
  const FoodFiesta({super.key});

  @override
  State<FoodFiesta> createState() => _FoodFiestaState();
}

class _FoodFiestaState extends State<FoodFiesta> {
  Map<String, bool> _filters = {
    'oilfree': false,
    'saltfree': false,
    'vegetarian': false,
  };
  List<EachMixModel> _availablemeal = EachMixModeldata;
  List<EachMixModel> _favouritemeals = [];

  void _savefilter(Map<String, bool> filterdata) {
    setState(() {
      _filters = filterdata;

      _availablemeal = EachMixModeldata.where((EachMixModel) {
        if (_filters['oilfree']! && !EachMixModel.isoilfree) {
          return false;
        }
        if (_filters['saltfree']! && !EachMixModel.issaltfree) {
          return false;
        }
        if (_filters['vegetarian']! && !EachMixModel.isvegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favouritemeals.indexWhere((EachMixModel) => EachMixModel.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favouritemeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouritemeals.add(
          EachMixModeldata.firstWhere(
              (EachMixModel) => EachMixModel.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favouritemeals.any((EachMixModel) => EachMixModel.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FoodFiesta',
      routes: {
        '/': (ctx) => TabsScreen(_favouritemeals),
        EachMixScreen.routeName: (ctx) => EachMixScreen(_availablemeal),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FilterScreen.routeName: (ctx) => FilterScreen([_filters], _savefilter),
      },
    );
  }
}
