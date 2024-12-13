import 'package:flutter/material.dart';
import 'package:foodfiesta/models/meal_model.dart';
import 'package:foodfiesta/screens/favourite_item_screen.dart';
import 'package:foodfiesta/screens/home_page.dart';
import 'package:foodfiesta/widgets/main_drawer_ui.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen(this.starmeals);
  final List<EachMixModel> starmeals;
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages = [];
  int _selectedpageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': HomePage(), 'title': 'All Categories'},
      {'page': FavoritesScreen(widget.starmeals), 'title': 'Your Favourite'}
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedpageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        title: Text(
          _pages[_selectedpageIndex]['title'] as String,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.pinkAccent,
              fontSize: 26),
        ),
      ),
      drawer: MainDrawerUi(),
      body: _pages[_selectedpageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.pinkAccent,
          unselectedItemColor: Colors.black,
          currentIndex: _selectedpageIndex,
          onTap: _selectPage,
          backgroundColor: Colors.amberAccent,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Category'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourite'),
          ]),
    );
  }
}
