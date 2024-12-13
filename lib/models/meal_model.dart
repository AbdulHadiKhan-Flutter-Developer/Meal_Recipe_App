enum Complaxity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricy,
  Luxurious,
}

class EachMixModel {
  final String id;
  final List<String> categoriesid;
  final String title;
  final String imageurl;
  final List<String> ingredients;
  final List<String> steps;
  final bool isoilfree;
  final bool issaltfree;
  final bool isvegetarian;
  final int duration;
  final Complaxity complaxity;
  final Affordability affordability;

 const EachMixModel(
      {required this.id,
      required this.categoriesid,
      required this.title,
      required this.imageurl,
      required this.ingredients,
      required this.steps,
      required this.isoilfree,
      required this.issaltfree,
      required this.isvegetarian,
      required this.duration,
      required this.complaxity,
      required this.affordability});
}
