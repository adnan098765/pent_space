import 'package:flutter/material.dart';

class CustomRouteBuilder {
  BuildContext context;
  CustomRouteBuilder(this.context);
  Route createRoute(Widget screen) {
    return PageRouteBuilder(
      opaque: false,
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.ease;
        animation = CurvedAnimation(curve: curve, parent: animation);
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
