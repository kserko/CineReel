import 'package:flutter/material.dart';

class RouteTransition extends PageRouteBuilder {
  final Widget widget;
  RouteTransition({this.widget})
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return widget;
        }, transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return new FadeTransition(opacity: animation, child: child);

//				return new SlideTransition(
//					position: new Tween<Offset>(
//						begin: const Offset(-1.0, 0.0),
//						end: Offset.zero,
//					).animate(animation),
//					child: child,
//				);
        });
}
