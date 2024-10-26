import 'package:flutter/material.dart';

import 'package:meals/Category/category.dart';

class CategoryMenue extends StatelessWidget {
  const CategoryMenue(this.value, this.screenChanger, {super.key});
  final Category value;
  final void Function() screenChanger;

  @override
  Widget build(context) {
    return InkWell(
      onTap: screenChanger,
      splashColor: Theme.of(context).colorScheme.onBackground,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              value.color.withOpacity(.55),
              value.color.withOpacity(0.9),
            ], begin: Alignment.topLeft, end: Alignment.bottomLeft),
            borderRadius: BorderRadius.circular(16)),
        child: Text(
          value.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.background),
        ),
      ),
    );
  }
}
