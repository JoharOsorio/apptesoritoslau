import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/product.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const ProductAdded(cartItem: []));

  final List<Product> _cartItems = [];
  List<Product> get items => _cartItems;
  bool isGridView = true;

  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is AddProduct) {
      _cartItems.add(event.productIndex);
      yield ProductAdded(cartItem: _cartItems);
    } else if (event is RemoveProduct) {
      _cartItems.remove(event.productIndex);
      yield ProductRemoved(cartItem: _cartItems);
    } else if (event is CategoryFilter) {
      _cartItems.clear();
      yield CategoryFiltered(cartItem: _cartItems, category: event.category);
    }
  }
}