import 'package:flutter/material.dart';
import '../../presentation/screens/home.dart';
import '../../presentation/screens/product.dart';

class AppRoute {
  static Route? onGenerated(RouteSettings settings) {
    switch (settings.name) {
      case "/home":
        return _materialRoute(Home());

      case "/product":
        return _materialRoute(ProductDetail());

      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget page) {
    return MaterialPageRoute(builder: (builder) => page);
  }
}
