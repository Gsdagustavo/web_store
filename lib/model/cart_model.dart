import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

import 'cart_item.dart';

/// This class represents a [Shopping Cart] from a [User]
///
/// It an Identifier [id], a [list] of [products] and a User Identifier [userId]
///
/// It also has methods to add an item to the cart, remove an item and deleting and item
///
/// Difference between [removing] and [deleting] an item: [removing] means [decrementing]
/// one unit of an item. E.g: if a [user] with a [cart] containing [10 units] of a specific
/// products [removes] one of them, then the [quantity] will reduce to 9,
///
/// But if the [user] [deletes] an [item], the [item] will be [removed completely] from
/// the cart, [independent of the quantity]
class Cart {
  final int id;
  final List<CartItem> products;
  final int userId;

  Cart({required this.id, required this.products, required this.userId});

  /// Returns an instance of a [Cart] based on the given [json]
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

  /// Get the total quantity of unique products
  int get totalProducts {
    return products.length;
  }

  /// Get the total quantity of products
  int get totalQuantity {
    return products.fold(0, (sum, product) => sum += product.quantity);
  }

  /// Get the total price of all products
  double get total {
    return products.fold(0, (sum, product) => sum += product.total);
  }

  /// Adds a [CartItem] to the [products] list
  void addItem({required CartItem cartItem}) {
    CartItem? existingItem = products.firstWhereOrNull(
      (item) => item.id == cartItem.id,
    );

    debugPrint('p: $existingItem');

    if (products.isEmpty || existingItem == null) {
      products.add(cartItem);
      debugPrint('single product added');
      return;
    }

    debugPrint('product quantity added');
    existingItem.quantity++;
  }

  /// Removes a [CartItem] from the [products] list
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

  /// Deletes a [CartItem] from the [products] list
  void deleteItem({required CartItem cartItem}) {
    CartItem? existingItem = products.firstWhereOrNull(
      (item) => item == cartItem,
    );

    if (products.isEmpty || existingItem == null) {
      throw Exception('Tried to delete an unexisting product from the cart');
    }

    products.remove(existingItem);
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
