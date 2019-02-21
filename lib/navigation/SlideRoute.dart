import 'package:flutter/material.dart';

class RouteTransition extends PageRouteBuilder {
  final Widget widget;

  RouteTransition({this.widget})
      : super(pageBuilder: (BuildContext context, Animation<double> animation, Animation<double>secondaryAnimation) {
          return widget;
        },
			transitionDuration: const Duration(milliseconds: 550),
			transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
            return new FadeTransition(opacity: animation, child: child);
        });
}
