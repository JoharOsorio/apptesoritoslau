import 'package:apptesoritoslau/services/app_theme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height); 

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Tesoritos Lau ',
        style: AppTheme.of(context).title1,
      ),
      elevation: 0,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      actions: <Widget>[
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: TextButton.icon(
                style: TextButton.styleFrom(foregroundColor: Colors.black),
                onPressed: () {
                  //Navigator.pushNamed(context, CartPage.routeName);
                },
                icon: const Icon(Icons.shopping_cart),
                label: const Text(''),
                key: const Key('cart'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}