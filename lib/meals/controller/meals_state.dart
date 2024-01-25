part of 'meals_cubit.dart';

sealed class MealsState extends Equatable {
  const MealsState({required this.currentMeal});

  final Meal currentMeal;

  @override
  List<Object?> get props => [currentMeal];
}

final class MealsChangeIndex extends MealsState {
  const MealsChangeIndex({required super.currentMeal});
  @override
  List<Object?> get props => [currentMeal];
}
