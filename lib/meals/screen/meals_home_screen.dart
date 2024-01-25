import 'package:ex/meals/controller/meals_cubit.dart';
import 'package:ex/meals/model/meal.dart';
import 'package:ex/meals/widget/meal_vertical_item.dart';
import 'package:ex/meals/widget/shader_mask_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({super.key});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      appBar: AppBar(
        title: const Text("C2"),
      ),
      body: ShaderMaskWidget(
        isDetails: false,
        child: Column(
          children: [
            const Text('Most'),
            const Text('Popular food'),
            SizedBox(
              height: 650.h,
              child: PageView.builder(
                  itemCount: meals.length,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: PageController(viewportFraction: 0.70),
                  onPageChanged: (index) => context
                      .read<MealsCubit>()
                      .changeCurrentMeal(meals[index]),
                  itemBuilder: (c, i) => MealVerticalItem(
                        meal: meals[i],
                      )),
            ),
            SizedBox(height: 20.h)
          ],
        ),
      ),
      
    );
  }
}
