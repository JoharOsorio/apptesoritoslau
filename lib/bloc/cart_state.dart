import '../../models/product.dart';

abstract class CartState {
  final List<Product> cartItem;
  final bool isGridView;
  const CartState({this.cartItem = const [], this.isGridView = true});

  List<Object> get props => [];
}

class CartLoadInProgress extends CartState {
  CartLoadInProgress({required super.cartItem});
}

class ProductAdded extends CartState {
  final List<Product> cartItem;

  const ProductAdded({required this.cartItem}) : super(cartItem: cartItem);

  @override
  List<Object> get props => [cartItem];

  @override
  String toString() => 'ProductAdded { todos: $cartItem }';
}

class ProductRemoved extends CartState {
  final List<Product> cartItem;

  const ProductRemoved({required this.cartItem}) : super(cartItem: cartItem);

  @override
  List<Object> get props => [cartItem];

  @override
  String toString() => 'ProductRemoved { todos: $cartItem }';
}

class CategoryFiltered extends CartState {
  final List<Product> cartItem;
  final String category;

  const CategoryFiltered({required this.cartItem, required this.category})
      : super(cartItem: cartItem);

  @override
  List<Object> get props => [cartItem, category];

  @override
  String toString() =>
      'CategoryFiltered { todos: $cartItem, category: $category }';
}