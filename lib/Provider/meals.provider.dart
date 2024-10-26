import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/Category/dummy_data.dart';

var mealsProvider =  Provider((ref)=> dummyMeals);