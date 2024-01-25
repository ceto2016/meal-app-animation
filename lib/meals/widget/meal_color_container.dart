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
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController.unbounded(vsync: this, duration: 5.seconds)
      ..repeat(min: -.5, max: 1.5);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: "MealColorContainer+${widget.meal.id}",
        child: AnimatedBuilder(
          animation: controller,
          builder: (_, child) => ShaderMask(
            shaderCallback: (rect) => LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    transform: _GradTransform(controller.value),
                    tileMode: TileMode.mirror,
                    colors: List.generate(
                        5,
                        (index) => [
                              widget.meal.backgroundColor,
                              widget.meal.backgroundColor.withOpacity(.94),
                              widget.meal.backgroundColor.withOpacity(.97),
                              widget.meal.backgroundColor.withOpacity(.97),
                              widget.meal.backgroundColor.withOpacity(.94),
                              widget.meal.backgroundColor,
                            ]).expand((e) => e).toList())
                .createShader(rect),
            child: child,
          ),
          child: BlocBuilder<MealsCubit, MealsState>(
            builder: (context, state) {
              return HeroMode(
                enabled: false,
                child: AnimatedContainer(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  duration: verticalMealContainerHeightExtentSpeed.ms,
                  height:
                      state.currentMeal.id == widget.meal.id ? 500.h : 400.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.h),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          widget.meal.backgroundColor.withOpacity(.9),
                          widget.meal.backgroundColor,
                        ]),
                    // color: widget.meal.backgroundColor,
                  ),
                ),
              );
            },
          ),
        ));
  }
}

class _GradTransform extends GradientTransform {
  final double value;
  const _GradTransform(this.value);
  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(9, -(bounds.height / 5) * value, 35);
  }
}
