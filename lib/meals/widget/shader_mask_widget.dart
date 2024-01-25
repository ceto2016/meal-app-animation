import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ShaderMaskWidget extends StatefulWidget {
  const ShaderMaskWidget(
      {super.key, required this.child, required this.isDetails});
  final Widget child;
  final bool isDetails;
  @override
  State<ShaderMaskWidget> createState() => _ShaderMaskWidgetState();
}

class _ShaderMaskWidgetState extends State<ShaderMaskWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController.unbounded(vsync: this, duration: 10.seconds)
          ..repeat(min: -1.5, max: 2.5);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, child) => ShaderMask(
        shaderCallback: (rect) => LinearGradient(
                begin:
                    widget.isDetails ? Alignment.topCenter : Alignment.topLeft,
                end: widget.isDetails
                    ? Alignment.bottomCenter
                    : Alignment.bottomRight,
                transform: _GradTransform(controller.value),
                tileMode: TileMode.mirror,
                colors: List.generate(
                    5,
                    (index) => [
                          const Color(0xFFf1f1f1),
                          const Color(0xFFf1f1f1),
                          const Color(0xFFf1f1f1),
                          const Color(0xFFf1f1f1).withOpacity(.9),
                          const Color(0xFFf1f1f1).withOpacity(.98),
                          const Color(0xFFf1f1f1).withOpacity(.98),
                          const Color(0xFFf1f1f1).withOpacity(.98),
                          const Color(0xFFf1f1f1).withOpacity(.9),
                          const Color(0xFFf1f1f1),
                          const Color(0xFFf1f1f1),
                          const Color(0xFFf1f1f1),
                        ]).expand((e) => e).toList())
            .createShader(rect),
        child: child,
      ),
      child: widget.child,
    );
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
