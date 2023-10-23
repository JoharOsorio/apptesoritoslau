import 'package:apptesoritoslau/widgets/product_listing_widget.dart';
import 'package:apptesoritoslau/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes{
  static const initialRoute= '/login';

  static Map<String, Widget Function (BuildContext)> routes = {
    '/login': (BuildContext context) => const LoginScreen(),
    '/product-list': (BuildContext context) => const ProductListingWidget(),
    '/product-list-detail': (BuildContext context) => const ProductListDetailScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    return MaterialPageRoute(
      builder: (context) => const ErrorScreen(),
    );
  }
}