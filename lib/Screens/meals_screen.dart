import 'package:flutter/material.dart';
import 'package:meals/Meals/meals.dart';
import 'package:meals/Screens/meal_details_screen.dart';
import 'package:meals/Screens/meal_items_screen.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(this.meal, {this.title, super.key});

  final String? title;
  final List<Meal> meal;

  void detailScreen(BuildContext context, Meal meal) {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return MealDetailsScreen(meal);
    }));
  }

  @override
  Widget build(BuildContext context) {
    Widget body = ListView.builder(
        itemCount: meal.length,
        itemBuilder: (context, index) {
          return MealItemsScreen(
            meal: meal[index],
            onSelect: (meal) {
              detailScreen(context, meal);
            },
          );
        });

    if (meal.isEmpty) {
      body = const Center(
        child: Text(
          'Nothing  to  show...',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      );
    }

    if (title == null) {
      return body;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title!, style: const TextStyle(color: Colors.white)),
        ),
        body: body);
  }
}
