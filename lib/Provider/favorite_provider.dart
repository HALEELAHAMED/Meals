import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/Meals/meals.dart';


class  FavoriteMealsNotifier extends StateNotifier<List<Meal>>{
     FavoriteMealsNotifier() : super([]);

     
     bool addfavoriteMeal(Meal meals){
      final selectedMeals =  state.contains(meals);
      if(selectedMeals){
        state =  state.where((data) => data.id != meals.id).toList();
        return false;
      }else {state = [...state,meals];}
      return true;
     }
}


final myFavoriteMeals = StateNotifierProvider<FavoriteMealsNotifier,List<Meal>>((ref) =>  FavoriteMealsNotifier());