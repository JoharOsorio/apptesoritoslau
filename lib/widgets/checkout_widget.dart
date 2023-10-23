import 'package:apptesoritoslau/services/app_theme.dart';
import 'package:apptesoritoslau/bloc/cart_event.dart';
import 'package:apptesoritoslau/models/product.dart';
import 'package:apptesoritoslau/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';
import '../bloc/cart_state.dart';

class CheckoutWidget extends StatefulWidget {
  const CheckoutWidget({Key? key}) : super(key: key);

  @override
  _CheckoutWidgetState createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late List<Product> cartItems;

  @override
  void initState() {
    super.initState();
    setState(() {
      cartItems = BlocProvider.of<CartBloc>(context).items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar:const AppBarWidget(title: "Cart"),
      backgroundColor: AppTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    BlocBuilder<CartBloc, CartState>(builder: (_, cartState) {
                      return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: cartItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                              child: Container(
                                width: double.infinity,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: AppTheme.of(context).secondaryBackground,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x320E151B),
                                      offset: Offset(0, 1),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 8, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Hero(
                                        tag: 'ControllerImage',
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Image.network(
                                            cartItems[index].url,
                                            width: 80,
                                            height: 80,
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                              child: Text(
                                                cartItems[index].name,
                                                style: AppTheme.of(context).subtitle2.override(
                                                      fontFamily: 'Poppins',
                                                      color: AppTheme.of(context).primaryText,
                                                    ),
                                              ),
                                            ),
                                            Text(
                                              '\$${cartItems[index].price}',
                                              style: AppTheme.of(context).bodyText2,
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                              child: Text(
                                                'Quanity: ${cartItems[index].quantity}',
                                                style: AppTheme.of(context).bodyText2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.delete_outline_rounded,
                                          color: Color(0xFFE86969),
                                          size: 20,
                                        ),
                                        onPressed: () {
                                          BlocProvider.of<CartBloc>(context).add(RemoveProduct(cartItems[index]));
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    }),
                    
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: AppTheme.of(context).primaryColor,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x320E151B),
                    offset: Offset(0, -2),
                  )
                ],
                // borderRadius: BorderRadius.only(
                //   bottomLeft: Radius.circular(0),
                //   bottomRight: Radius.circular(0),
                //   topLeft: Radius.circular(16),
                //   topRight: Radius.circular(16),
                // ),
              ),
              alignment: const AlignmentDirectional(0, -0.35),
              child: Text(
                'Checkout (\$230.20)',
                style: AppTheme.of(context).title2.override(
                      fontFamily: 'Poppins',
                      color: AppTheme.of(context).primaryBtnText,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}