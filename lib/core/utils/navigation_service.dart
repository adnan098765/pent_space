import 'package:flutter/material.dart';
import 'package:pent_space/core/utils/custom_route_builder.dart';

class NavigationService {
  late GlobalKey<NavigatorState> navigationKey;

  static NavigationService instance = NavigationService();

  NavigationService() {
    navigationKey = GlobalKey<NavigatorState>();
  }

  Future<dynamic> navigateToReplacement(String _rn) {
    return navigationKey.currentState!.pushReplacementNamed(_rn);
  }

  Future<dynamic> navigateToAndRemoveUntil(String _rn) {
    return navigationKey.currentState!.pushNamedAndRemoveUntil(
      _rn,
      (Route<dynamic> route) => false,
    );
  }

  Future<dynamic> navigateTo(String _rn) {
    return navigationKey.currentState!.pushNamed(_rn);
  }

  Future<dynamic> navigateToRoute(MaterialPageRoute _rn) {
    return navigationKey.currentState!.push(_rn);
  }

  navigateToCustomRoute(Widget _rn) {
    return navigationKey.currentState!.push(
      CustomRouteBuilder(navigationKey.currentContext!).createRoute(_rn),
    );
  }

  Future<dynamic> navigate(Widget _rn) {
    return navigationKey.currentState!.push(
      MaterialPageRoute(builder: (context) => _rn),
    );
  }

  Future<dynamic> navigateReplaceTo(Widget _rn) {
    return navigationKey.currentState!.pushReplacement(
      MaterialPageRoute(builder: (context) => _rn),
    );
  }

  BuildContext getContext() {
    return navigationKey.currentContext!;
  }

  goback() {
    return navigationKey.currentState!.pop();
  }
}
