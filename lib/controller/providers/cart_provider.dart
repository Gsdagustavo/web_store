import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:web_store/model/cart_model.dart';

import '../../core/constants/urls.dart';
import '../../model/cart_item.dart';

/// This class is a [Provider] made to keep track of a [Cart] based on the
/// [logged user] information
///
/// All [carts] and [user] information are gathered from the DummyJson API
/// All endpoints used are listed in the [urls] class
class CartProvider with ChangeNotifier {
  Cart? cart;

  bool hasError = false;
  String errorMessage = '';

  bool isLoading = false;

  /// Loads the [cart] based on the given [userId] and assigns it as a [Cart]
  Future<void> loadCart({required int userId}) async {
    isLoading = true;
    notifyListeners();

    debugPrint('load cart called');

    try {
      final response = await http.get(Uri.parse('$cartsUrl/$userId'));

      debugPrint('load cart status code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        final cartsJson = json['carts'] as List<dynamic>;

        if (cartsJson.isNotEmpty) {
          cart = Cart.fromJson(cartsJson.first);
        } else {
          throw Exception('No cart found for the user with id $userId');
        }
      } else if (response.statusCode == 404) {
        throw Exception('Page not found');
      } else if (response.statusCode == 401) {
        throw Exception('Access not allowed');
      } else {
        throw Exception(
          'An error occurred while trying to fetch the cart data',
        );
      }
    } catch (e) {
      errorMessage = e.toString();
      hasError = true;
      cart = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// Adds an item to the cart
  void addItem({required CartItem cartItem}) {
    if (cart != null) {
      cart!.addItem(cartItem: cartItem);
    }

    notifyListeners();
  }

  /// Removes an item from the cart
  void removeItem({required CartItem cartItem}) {
    if (cart != null) {
      cart!.removeItem(cartItem: cartItem);
    }

    notifyListeners();
  }

  /// Deletes an item from the cart
  void deleteItem({required CartItem cartItem}) {
    if (cart != null) {
      cart!.deleteItem(cartItem: cartItem);
    }

    notifyListeners();
  }
}
