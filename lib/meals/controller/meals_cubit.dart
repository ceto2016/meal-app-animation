import 'package:equatable/equatable.dart';
import 'package:ex/meals/model/meal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'meals_state.dart';

class MealsCubit extends Cubit<MealsState> {
  MealsCubit() : super(MealsChangeIndex(currentMeal: meals.first));
  Meal currentMealIndex = meals.first;
  init() {
    emit(MealsChangeIndex(currentMeal: currentMealIndex));
  }

  void changeCurrentMeal(Meal newMealIndex) {
    currentMealIndex = newMealIndex;
    emit(MealsChangeIndex(currentMeal: newMealIndex));
  }
}
