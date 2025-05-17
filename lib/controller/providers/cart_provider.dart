import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:web_store/model/cart_model.dart';

import '../../core/constants/urls.dart';

class CartProvider with ChangeNotifier {
  late final Cart? cart;

  bool hasError = false;
  String errorMessage = '';

  bool isLoading = false;

  CartProvider() {
    _init();
  }

  void _init() async {
    await loadCart();
  }

  Future<void> loadCart() async {
    isLoading = true;

    try {
      final response = await http.get(Uri.parse(cartsUrl));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        debugPrint('Cart: ${json.toString()}');
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
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
