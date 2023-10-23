class Product {
  final String id;
  final String name;
  final String url;
  final int price;
  int quantity;

  Product({required this.id, required this.name, required this.url, required this.price, this.quantity = 0});
}