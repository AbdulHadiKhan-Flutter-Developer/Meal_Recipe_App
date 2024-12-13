import 'package:flutter/material.dart';
import 'package:foodfiesta/widgets/main_drawer_ui.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = 'filter_screen';
  final Function onSaveFilter;
  final List<Map<String, bool>> currentfilter;
  FilterScreen(this.currentfilter, this.onSaveFilter);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _OilFree = false;
  bool _Vegetarian = false;
  bool _SaltFree = false;

  @override
  initState() {
    _OilFree = widget.currentfilter[0]['oilfree'] as bool;
    _SaltFree = widget.currentfilter[0]['saltfree'] as bool;
    _Vegetarian = widget.currentfilter[0]['vegetarian'] as bool;
    super.initState();
  }

  Widget _buildSwitch(String title, String slogen, bool currentvalue,
      ValueChanged<bool> updatedvalue) {
    return SwitchListTile(
      value: currentvalue,
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ) as Widget,
      subtitle: Text(slogen) as Widget,
      onChanged: updatedvalue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  final selectedfilters = {
                    'oilfree': _OilFree,
                    'saltfree': _SaltFree,
                    'vegetarian': _Vegetarian,
                  };
                  widget.onSaveFilter(selectedfilters);
                },
                icon: Icon(Icons.save))
          ],
          centerTitle: true,
          backgroundColor: Colors.amberAccent,
          title: Text(
            'Filters',
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent),
          ),
        ),
        drawer: MainDrawerUi(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                textAlign: TextAlign.center,
                'Edit Your Food!',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitch('Oil Free', 'only oil free meals', _OilFree,
                    (newvalue) {
                  setState(() {
                    _OilFree = newvalue;
                  });
                }),
                _buildSwitch('Salt Free', 'only salt free meals', _SaltFree,
                    (newvalue) {
                  setState(() {
                    _SaltFree = newvalue;
                  });
                }),
                _buildSwitch('Vegetarian', 'only vegetarian meals', _Vegetarian,
                    (newvalue) {
                  setState(() {
                    _Vegetarian = newvalue;
                  });
                })
              ],
            ))
          ],
        ));
  }
}
