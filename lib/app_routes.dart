import 'package:apptesoritoslau/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes{
  static const initialRoute= '/login';

  static Map<String, Widget Function (BuildContext)> routes = {
    '/login': (BuildContext context) => const LoginScreen(),
    '/sign-up': (BuildContext context) => const SignUp(),
    '/product-list': (BuildContext context) => ProductListScreen(),
    '/product-list-detail': (BuildContext context) => const ProductListDetailScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    return MaterialPageRoute(
      builder: (context) => const Error(),
    );
  }
}