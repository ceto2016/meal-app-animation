import 'package:ex/meals/constant.dart';
import 'package:ex/meals/controller/meals_cubit.dart';
import 'package:ex/meals/model/meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DishWidget extends StatefulWidget {
  const DishWidget({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  State<DishWidget> createState() => _DishWidgetState();
}

class _DishWidgetState extends State<DishWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController rotateController;
  @override
  void initState() {
    super.initState();
    rotateController = AnimationController(
      vsync: this,
    );
  }

  @override
  void dispose() {
    rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MealsCubit, MealsState>(listener: (context, state) {
      if (widget.meal.id == state.currentMeal.id) {
        rotateController.reset();
        rotateController.forward();
      } else {
        rotateController.reset();
      }
    }, builder: (context, state) {
      return DishItem(
        meal: widget.meal,
        size: 200.h,
      )
          .animate(controller: rotateController, autoPlay: false)
          .rotate(
            duration: dishFirstRotatingSpeed.ms,
            delay: dishFirstRotatingDelay.ms,
            end: dishFirstRotatingEnd,
          )
          .rotate(
            duration: dishSecondeRotatingSpeed.ms,
            delay: dishSecondeRotatingDelay.ms,
            end: dishSecondeRotatingEnd,
          )
          .rotate(
            duration: dishThirdRotatingSpeed.ms,
            delay: dishThirdRotatingDelay.ms,
            end: dishThirdRotatingEnd,
          );
    });
  }
}

class DishItem extends StatelessWidget {
  const DishItem({
    super.key,
    required this.meal,
    required this.size,
  });

  final Meal meal;
  final double size;

  @override
  Widget build(BuildContext context) {
    return HeroMode(
      enabled: true,
      child: Hero(
          tag: meal.id,
          child: Container(
            alignment: Alignment.center,
            child: PhysicalShape(
                color: Colors.transparent,
                shadowColor: Colors.black.withOpacity(.2),
                elevation: 12,
                clipper: const ShapeBorderClipper(shape: CircleBorder()),
                child: Image.asset(
                  meal.imageUrl,
                  height: size + 30.h,
                  width: size + 30.h,
                )),
          )),
    );
  }
}

/*
  Image.asset(
          meal.imageUrl,
          height: size + 20.h,
          width: size + 20.h,
        ),]
      ),
 */
const List<BoxShadow> boxShadow = [
  BoxShadow(
    color: Color.fromRGBO(212, 212, 212, 0.15),
    offset: Offset(0, 1),
    blurRadius: 2,
    spreadRadius: 0,
  ),
  BoxShadow(
    color: Color.fromRGBO(212, 212, 212, 0.13),
    offset: Offset(0, 4),
    blurRadius: 4,
    spreadRadius: 0,
  ),
  BoxShadow(
    color: Color.fromRGBO(212, 212, 212, 0.08),
    offset: Offset(-1, 9),
    blurRadius: 5,
    spreadRadius: 0,
  ),
  BoxShadow(
    color: Color.fromRGBO(212, 212, 212, 0.02),
    offset: Offset(-2, 15),
    blurRadius: 6,
    spreadRadius: 0,
  ),
];
