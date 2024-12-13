import 'package:flutter/material.dart';
import 'package:foodfiesta/models/home_category_mix_data_model.dart';
import 'package:foodfiesta/widgets/home_page_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(10),
        children: HomeCategoryDataModel.map(
                (hdata) => HomeCategoryUi(hdata.id, hdata.title, hdata.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20),
      ),
    );
  }
}
