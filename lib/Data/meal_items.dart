import 'package:flutter/material.dart';

import 'package:meals/Meals/meals.dart';

class MealItems extends StatelessWidget {
  const MealItems({
    super.key,
    required this.meals,
    
  });
  final Meal meals;

  get upperCase {
    return
    meals.affordability.name[0].toUpperCase() +
        meals.affordability.name.substring(1);
  }

  get coupperCase {
    return
    meals.complexity.name[0].toUpperCase() +
        meals.complexity.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Icon(Icons.alarm, color: Colors.white),
              const SizedBox(
                width: 6,
              ),
              Text('${meals.duration} Minut',
                  style: const TextStyle(color: Colors.white)),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Row(
            children: [
              const Icon(
                Icons.work_outlined,
                color: Colors.white,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(coupperCase,
                  style: const TextStyle(color: Colors.white)),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Row(
            children: [
              const Icon(
                Icons.attach_money,
                color: Colors.white,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                upperCase,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
