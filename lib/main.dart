import 'package:ex/meals/controller/meals_cubit.dart';
import 'package:ex/meals/screen/meals_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(430, 971),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return BlocProvider<MealsCubit>(
            create: (context) => MealsCubit()..init(),
            child: const MaterialApp(
              title: 'Meals',
              home: MealsScreen(),
            ),
          );
        });
  }
}
