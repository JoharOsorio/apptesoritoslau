import 'package:apptesoritoslau/bloc/bloc.dart';
import 'package:apptesoritoslau/models/product.dart';
import 'package:apptesoritoslau/services/app_theme.dart';
import 'package:apptesoritoslau/widgets/checkout_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as b;

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  final String title;

  const AppBarWidget({
    super.key,
    required this.title,
    // required this.widget,
  });


  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height); 

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.of(context).secondaryBackground,
      automaticallyImplyLeading: false,
      leading: InkWell(
        onTap: () async {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_rounded,
          color: AppTheme.of(context).secondaryText,
          size: 24,
        ),
      ),
      title: Text(
        title,
        style: AppTheme.of(context).subtitle2.override(
              fontFamily: 'Lexend Deca',
              color: Color(0xFF151B1E),
              fontSize: 26,
              fontWeight: FontWeight.w500,
            ),
      ),
      actions: [
        BlocBuilder<CartBloc, CartState>(builder: (_, cartState) {
          List<Product> cartItem = cartState.cartItem;
          return Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 24, 0),
            child: b.Badge(
              badgeContent: Text(
                '${cartItem.length}',
                style: AppTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
              ),
              showBadge: true,
              shape: b.BadgeShape.circle,
              badgeColor: AppTheme.of(context).primaryColor,
              elevation: 4,
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              position: b.BadgePosition.topEnd(),
              animationType: b.BadgeAnimationType.scale,
              toAnimate: true,
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: AppTheme.of(context).secondaryText,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckoutWidget(),
                    ),
                  );
                },
              ),
            ),
          );
        }),
      ],
      centerTitle: true,
      elevation: 0,
    );
  }
}