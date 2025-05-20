import 'package:collection/collection.dart';

import 'cart_item.dart';

class Cart {
  final int id;
  final List<CartItem> products;
  final int userId;

  Cart({required this.id, required this.products, required this.userId});

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      products:
          (json['products'] as List<dynamic>)
              .map((product) => CartItem.fromJson(product))
              .toList(),
      userId: json['userId'],
    );
  }

  int get totalProducts {
    return products.length;
  }

  int get totalQuantity {
    return products.fold(0, (sum, product) => sum += product.quantity);
  }

  double get total {
    return products.fold(0, (sum, product) => sum += product.total);
  }

  void addItem({required CartItem cartItem}) {
    CartItem? existingItem = products.firstWhereOrNull(
      (item) => item == cartItem,
    );

    if (products.isEmpty || existingItem == null) {
      products.add(cartItem);
      return;
    }

    existingItem.quantity++;
  }

  void removeItem({required CartItem cartItem}) {
    CartItem? existingItem = products.firstWhereOrNull(
          (item) => item == cartItem,
    );

    if (products.isEmpty || existingItem == null) {
      throw Exception('Tried to remove an unexisting product from the cart');
    }

    if (existingItem.quantity == 1) {
      products.remove(existingItem);
      return;
    }

    existingItem.quantity--;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Cart &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          products == other.products &&
          userId == other.userId;

  @override
  int get hashCode => Object.hash(id, products, userId);

  @override
  String toString() {
    return 'Cart{id: $id, products: $products, userId: $userId}';
  }
}
