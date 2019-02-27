import 'package:flutter/animation.dart';

class MovieDetailsEnterAnimation {
  final AnimationController controller;
  final Animation<double> headerOpacity;
  final Animation<double> posterBlur;
  final Animation<double> extraDetailsOpacity;
  final Animation<double> titleOpacity;
  final Animation<double> minorDetailsOpacity;
  final Animation<double> overviewOpacity;
  final Animation<double> overviewDividerWidth;

  static double fullWidth;

  MovieDetailsEnterAnimation(AnimationController this.controller)
      : posterBlur = Tween(
          begin: 0.0,
          end: 25.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.2, 1.0, curve: Curves.ease),
          ),
        ),
        headerOpacity = Tween(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 1.0, curve: Curves.ease),
          ),
        ),
        titleOpacity = Tween(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 0.75, curve: Curves.ease),
          ),
        ),
        minorDetailsOpacity = Tween(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.7, 1.0, curve: Curves.ease),
          ),
        ),
        overviewOpacity = Tween(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.7, 1.0, curve: Curves.ease),
          ),
        ),
        overviewDividerWidth = Tween(
          begin: 0.0,
          end: fullWidth,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.65, 1.0, curve: Curves.ease),
          ),
        ),
        extraDetailsOpacity = Tween(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.9, 1.0, curve: Curves.easeOut),
          ),
        );
}