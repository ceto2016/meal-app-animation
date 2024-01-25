import 'package:ex/meals/constant.dart';
import 'package:ex/meals/controller/meals_cubit.dart';
import 'package:ex/meals/model/meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealColorContainer extends StatefulWidget {
  const MealColorContainer({super.key, required this.meal});
  final Meal meal;
  @override
  State<MealColorContainer> createState() => _MealColorContainerState();
}

class _MealColorContainerState extends State<MealColorContainer>
   {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Hero(
          tag: "MealColorContainer+${widget.meal.id}",
          flightShuttleBuilder: (
            BuildContext flightContext,
            Animation<double> animation,
            HeroFlightDirection flightDirection,
            BuildContext fromHeroContext,
            BuildContext toHeroContext,
          ) {
            late Widget hero;
            if (flightDirection == HeroFlightDirection.push) {
              hero = fromHeroContext.widget;
            } else {
              hero = toHeroContext.widget;
            }
            return RotationTransition(
              turns: Tween<double>(begin: 0, end: 1 / 4).animate(animation),
              child: ScaleTransition(
                scale: Tween<double>(begin: 1, end: 5).animate(animation),
                child: hero,
              ),
            );
          },
          child: BlocBuilder<MealsCubit, MealsState>(
            builder: (context, state) {
              return AnimatedContainer(
                transform: Matrix4.identity()..scale(1.15),
                transformAlignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                duration: verticalMealContainerHeightExtentSpeed.ms,
                height: state.currentMeal.id == widget.meal.id ? 450.h : 400.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.h),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        widget.meal.backgroundColor.withOpacity(.9),
                        widget.meal.backgroundColor,
                      ]),
                  // color: widget.meal.backgroundColor,
                ),
                  
              );
            },
            
          )),
    );
  }
}
