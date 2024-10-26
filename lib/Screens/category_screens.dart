import 'package:flutter/material.dart';
import 'package:meals/Category/category.dart';
import 'package:meals/Meals/meals.dart';

import 'package:meals/Screens/meals_screen.dart';
import 'package:meals/Widgets/category_menue.dart';
import 'package:meals/Category/dummy_data.dart';

class CategoryScreens extends StatefulWidget {
  const CategoryScreens(this.lastfilter, {super.key});

  final List<Meal> lastfilter;

  @override
  State<CategoryScreens> createState() => _CategoryScreensState();
}

class _CategoryScreensState extends State<CategoryScreens>
    with SingleTickerProviderStateMixin {
  void screenChanger(BuildContext context, Category value) {
    final filteredList = widget.lastfilter
        .where((element) => element.categories.contains(value.id))
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: value.title,
          filteredList,
        ),
      ),
    );
  }

  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        lowerBound: 0,
        upperBound: 1);
    super.initState();
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: _animationController,
    child: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (Category value in availableCategories)
            CategoryMenue(value, () {
              screenChanger(context, value);
            }),
        ],
      
    ),
     builder: (context,child)=> SlideTransition(position:_animationController.drive(Tween(begin: const Offset(0, 0.5),end:const Offset(0, 0))) ,child: child, ));
    
  }
}
