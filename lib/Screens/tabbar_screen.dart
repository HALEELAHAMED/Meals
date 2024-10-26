import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/Provider/favorite_provider.dart';
import 'package:meals/Screens/category_screens.dart';
import 'package:meals/Screens/filters_screen.dart';
import 'package:meals/Screens/meals_screen.dart';
import 'package:meals/Widgets/drawer.dart';

import 'package:meals/Provider/filter_provider.dart';

const kfilter = {
  Filters.isGlutenFree: false,
  Filters.isLactoseFree: false,
  Filters.isVegan: false,
  Filters.isVegitarian: false
};

class TabBarScreen extends ConsumerStatefulWidget {
  const TabBarScreen({super.key});
  @override
  ConsumerState<TabBarScreen> createState() {
    return _TabBarScreen();
  }
}

class _TabBarScreen extends ConsumerState<TabBarScreen> {


  // void shoinfoMessage(String content) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(content),
  //       duration: const Duration(seconds: 3),
  //     ),
  //   );
  // }

//Favorite meal

  // void fovoriteMeal(Meal meal) {
  //   var check = favorite.contains(meal);

  //   if (check) {
  //     setState(() {
  //       favorite.remove(meal);
  //     });
  //     shoinfoMessage('Favorit Removed');
  //   } else {
  //     setState(() {
  //     });
  //     shoinfoMessage('Favorit Added');
  //   }     favorite.add(meal);
  // }

  var counter = 0;

  void tabscreen(int index) {
    setState(() {
      counter = index;
    });
  }

//Side Drawer

  void sideDrawer(String value)  {
    Navigator.pop(context);
    if (value == 'filter') {
      Navigator.push<Map<Filters, bool>>(context,
          MaterialPageRoute(builder: (ctx) {
        return const FiltersScreen();
      },),);
  
    }
  }

  @override
  Widget build(BuildContext context) {
  

    final lastfilter = ref.watch(filteredMealsProvider);

    Widget activescreen = CategoryScreens(lastfilter);
    var activescreentitiles = 'Pick Your Category';
    final favorit = ref.watch(myFavoriteMeals);
    if (counter == 1) {
      activescreen = MealsScreen(favorit);
      activescreentitiles = 'Favorites';
    }
    return Scaffold(
      drawer: MyDrawer(onSelect: sideDrawer),
      body: activescreen,
      appBar: AppBar(
        title: Text(activescreentitiles),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: counter,
        onTap: tabscreen,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal_rounded), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite')
        ],
      ),
    );
  }
}
