import 'package:ex/meals/constant.dart';
import 'package:ex/meals/controller/meals_cubit.dart';
import 'package:ex/meals/model/meal.dart';
import 'package:ex/meals/screen/meal_details.dart';
import 'package:ex/meals/widget/dish_widget.dart';
import 'package:ex/meals/widget/meal_color_container.dart';
import 'package:ex/meals/widget/meal_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealVerticalItem extends StatelessWidget {
  const MealVerticalItem({
    super.key,
    required this.meal,
  });
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealsCubit, MealsState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                PageRouteBuilder(
                    transitionDuration: pageTransitionSpeed.ms,
                    pageBuilder: (_, __, ___) => MealDetailsScreen(
                          meal: meal,
                        )));
          },
          child: Stack(alignment: Alignment.bottomCenter, children: [
            MealColorContainer(meal: meal),
            CardContent(meal: meal),
            AnimatedPositioned(
                duration: dishVerticalSlideSpeed.ms,
                curve: Curves.easeInOut,
                top: state.currentMeal.id == meal.id ? 50 : 120.h,
                child: DishWidget(meal: meal))
          ]),
        );
      },
    );
  }
}
