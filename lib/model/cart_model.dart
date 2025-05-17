import 'cart_item.dart';

class Cart {
  final int id;
  final List<CartItem> products;
  final double total;
  final int userId;
  final int totalProducts;
  final int totalQuantity;

  Cart({
    required this.id,
    required this.products,
    required this.total,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      products:
          (json['products'] as List<dynamic>)
              .map((product) => CartItem.fromJson(product))
              .toList(),
      total: json['total'],
      userId: json['userId'],
      totalProducts: json['totalProducts'],
      totalQuantity: json['totalQuantity'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Cart &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          products == other.products &&
          total == other.total &&
          userId == other.userId &&
          totalProducts == other.totalProducts &&
          totalQuantity == other.totalQuantity;

  @override
  int get hashCode =>
      Object.hash(id, products, total, userId, totalProducts, totalQuantity);

  @override
  String toString() {
    return 'Cart{id: $id, products: $products, total: $total, userId: $userId, totalProducts: $totalProducts, totalQuantity: $totalQuantity}';
  }
}
