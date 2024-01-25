import 'package:ex/meals/model/meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant.dart';

class StarRatingWidget extends StatefulWidget {
  final int maxRating;
  final Meal meal;

  const StarRatingWidget(
      {super.key, required this.maxRating, required this.meal});

  @override
  State<StarRatingWidget> createState() => _StarRatingWidgetState();
}

class _StarRatingWidgetState extends State<StarRatingWidget> {
  late int currentRating;
  @override
  void initState() {
    super.initState();
    currentRating = widget.meal.rate.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        widget.maxRating,
        (index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  currentRating = index + 1;
                });
              },
              child: Icon(
                index < currentRating ? Icons.star : Icons.star_border,
                color: Colors.grey.shade200,
                size: 20.0.h,
              ),
            ),
          );
        },
      )
          .animate(
              delay: rateStartFadeInSpeed.milliseconds,
              interval: rateStartIntervalSpeed.milliseconds)
          .fadeIn(),
    );
  }
}
