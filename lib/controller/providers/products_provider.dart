import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:web_store/constants/urls.dart';
import 'package:web_store/model/product_model.dart';

abstract class IProductsProvider {
  Future loadProducts();
}

class ProductsProvider with ChangeNotifier implements IProductsProvider {
  final List<Product> products = [];

  ProductsProvider() {
    _init();
  }

  void _init() async {
    await loadProducts();
  }

  @override
  Future<void> loadProducts() async {
    final url = Uri.parse(productsUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final products = json['products'];
      debugPrint(products);
    } else {
      throw Exception('Erro ao carregar os produtos');
    }
  }
}
