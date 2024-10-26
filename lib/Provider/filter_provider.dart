import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/Provider/meals.provider.dart';


enum Filters {isGlutenFree, isVegan, isVegitarian, isLactoseFree }

var filterprovider = StateNotifierProvider< FilterNotifier, Map<Filters,bool>>((ref) => FilterNotifier());


class FilterNotifier extends StateNotifier<Map<Filters, bool>>{
  FilterNotifier():super(
    {
  Filters.isGlutenFree: false,
  Filters.isLactoseFree: false,
  Filters.isVegan: false,
  Filters.isVegitarian: false
  }
  );
  
  void filters(Map<Filters,bool>choosenFilter){
       state = choosenFilter;
  }

  void filter(Filters filter,bool isActive){ 
  state = {
    ...state,
    filter:isActive,
  };
  }
}

final filteredMealsProvider = Provider((ref) {
   final meals = ref.watch(mealsProvider);
   final activeFilters = ref.watch(filterprovider);
     
     return meals.where((map) {
      if (activeFilters[Filters.isGlutenFree]! && !map.isGlutenFree) {
        return false;
      }

      if (activeFilters[Filters.isLactoseFree]! && !map.isLactoseFree) {
        return false;
      }

      if (activeFilters[Filters.isVegan]! && !map.isVegan) {
        return false;
      }

      if (activeFilters[Filters.isVegitarian]! && !map.isVegetarian) {
        return false;
      }

      return true;
    }).toList(); });


