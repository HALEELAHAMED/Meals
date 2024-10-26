import 'package:flutter/material.dart';

import 'package:meals/Data/meal_items.dart';

import 'package:meals/Meals/meals.dart';

import 'package:transparent_image/transparent_image.dart';

class MealItemsScreen extends StatelessWidget {
  const MealItemsScreen(
      {super.key, required this.meal, required this.onSelect});
  final Meal meal;
  final Function(Meal meal) onSelect;

 

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          onSelect(meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(
                meal.imageUrl,
              ),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 80,
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: true,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    MealItems(meals: meal),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
