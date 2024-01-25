import 'package:ex/meals/controller/meals_cubit.dart';
import 'package:ex/meals/model/meal.dart';
import 'package:ex/meals/widget/rate_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardContent extends StatelessWidget {
  const CardContent({super.key, required this.meal});

  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100.h),
              Text(
                meal.name,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 16),
              BlocBuilder<MealsCubit, MealsState>(
                builder: (context, state) {
                  return AnimatedContainer(
                    duration: 300.ms,
                    height: state.currentMeal.id == meal.id ? 80.h : 0,
                    child: Text(
                      meal.description,
                      style: TextStyle(
                          color: Colors.grey.shade300.withOpacity(.9),
                          fontSize: 14),
                    ),
                  );
                },
              ),
              SizedBox(height: 32.h),
              StarRatingWidget(
                meal: meal,
                maxRating: 5,
              ),
              SizedBox(height: 32.h),
              Text(
                "${meal.price} \$",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.h),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Text(
                        "Add to cart",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      Icon(Icons.shopping_cart_outlined, color: Colors.blueGrey)
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }
}
