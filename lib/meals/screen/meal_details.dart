import 'package:ex/meals/constant.dart';
import 'package:ex/meals/controller/details_sheet_dart_cubit.dart';
import 'package:ex/meals/controller/meals_cubit.dart';
import 'package:ex/meals/model/meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/dish_widget.dart';
import '../widget/meal_color_container.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({super.key, required this.meal});
  final Meal meal;
  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailsSheetDartCubit>(
      create: (context) => DetailsSheetDartCubit(),
      child: Builder(builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            await context.read<DetailsSheetDartCubit>().closeDetailsSheet();
            return true;
          },
          child: Scaffold(
            body: Stack(alignment: AlignmentDirectional.topStart, children: [
              Stack(children: [
                AnimatedContainer(
                  duration: 1.seconds,
                  child: Positioned.fill(
                    left: -MediaQuery.of(context).size.height,
                    right: -MediaQuery.of(context).size.height,
                    top: -MediaQuery.of(context).size.height,
                    bottom: -MediaQuery.of(context).size.height,
                    child: MealColorContainer(meal: widget.meal)
                        .animate(delay: colorContainerInDetailsDelay.ms)
                        .rotate(
                            end: colorContainerInDetailsRotate,
                            duration:
                                colorContainerInDetailsSpeed.milliseconds),
                  ),
                )
              ]),
              const SafeArea(
                child: BackButton(
                  color: Colors.white,
                ),
              ),
              DishInDetailsWidget(meal: widget.meal),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: MealDetailsBottomSheet(meal: widget.meal),
              )
            ]),
          ),
        );
      }),
    );
  }
}

class DishInDetailsWidget extends StatefulWidget {
  const DishInDetailsWidget({
    super.key,
    required this.meal,
  });
  final Meal meal;

  @override
  State<DishInDetailsWidget> createState() => _DishInDetailsWidgetState();
}

class _DishInDetailsWidgetState extends State<DishInDetailsWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
    Future.microtask(() => context
        .read<DetailsSheetDartCubit>()
        .initDishController(animationController!));
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50.h,
      right: 0,
      left: 0,
      child: DishItem(
        meal: widget.meal,
        size: 300.h,
      )
          .animate(
              controller: animationController,
              onComplete: (c) => c.repeat(),
              delay: dishRotatingDelay.milliseconds)
          .rotate(
            duration: dishRotatingSpeed.seconds,
          ),
    );
  }
}

class MealDetailsBottomSheet extends StatefulWidget {
  const MealDetailsBottomSheet({
    super.key,
    required this.meal,
  });

  final Meal meal;
  @override
  State<MealDetailsBottomSheet> createState() => _MealDetailsBottomSheetState();
}

class _MealDetailsBottomSheetState extends State<MealDetailsBottomSheet>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
    Future.microtask(() => context
        .read<DetailsSheetDartCubit>()
        .initController(animationController!));
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealsCubit, MealsState>(
      builder: (context, state) {
        return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  height: 550.h,
                  padding: const EdgeInsets.all(32),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        widget.meal.name,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      RatingBar.builder(
                        initialRating: (widget.meal.rate),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 16,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.black87,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: widget.meal.backgroundColor,
                                borderRadius: BorderRadius.circular(50)),
                            child: const Row(children: [
                              Icon(
                                Icons.add_circle_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8),
                              Text("1", style: TextStyle(color: Colors.white)),
                              SizedBox(width: 8),
                              Icon(
                                Icons.remove_circle,
                                color: Colors.white,
                              ),
                            ]),
                          ),
                          Text("${widget.meal.price} \$",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Text("About this food",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      Text(("${widget.meal.description}\n") * 2,
                          style: TextStyle(
                              color: Colors.grey.shade600.withOpacity(.6),
                              height: 2,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400)),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 2,
                                  color: widget.meal.backgroundColor,
                                )),
                            child: Icon(Icons.favorite_border_rounded,
                                color: widget.meal.backgroundColor),
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                  color: widget.meal.backgroundColor,
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Row(
                                children: [
                                  Icon(Icons.shopping_cart_outlined,
                                      color: Colors.white),
                                  SizedBox(width: 8),
                                  Text(
                                    "Add to cart",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )),
                        ],
                      )
                    ],
                  ),
                ))
            .animate(
              controller: animationController,
              delay: 1500.milliseconds,
            )
            .slideY(begin: 1, end: 0, duration: 500.milliseconds);
      },
    );
  }
}
