import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:web_store/model/product_model.dart';

import '../../core/constants/urls.dart';

abstract class IProductsProvider {
  Future loadProducts();
}

class ProductsProvider with ChangeNotifier implements IProductsProvider {
  final List<Product> products = [];
  final List<Product> filteredProducts = [];
  final List<String> selectedTags = [];

  final searchController = TextEditingController();

  bool hasError = false;
  String errorMessage = '';

  bool isLoading = false;

  ProductsProvider() {
    _init();
  }

  void _init() async {
    await loadProducts();
    filteredProducts.clear();
    filteredProducts.addAll(products);
    notifyListeners();
  }

  Future<void> searchProducts() async {
    final search = searchController.text.trim().toLowerCase();

    filteredProducts.clear();

    for (final product in products) {
      final productTags = product.tags;

      bool containsAnyTag =
          selectedTags.isEmpty ||
          selectedTags.any((tag) => productTags.contains(tag));

      /// Filter the tags
      if (containsAnyTag) {
        /// Product's title and description
        final String title = product.title.trim().toLowerCase();
        final String description = product.description.trim().toLowerCase();

        bool containsTitle = title.contains(search);
        bool containsDescription = description.contains(search);

        /// Both title and description are in the search
        if (containsTitle && containsDescription) {
          filteredProducts.add(product);
        }
      }
    }

    debugPrint('filtered products: $filteredProducts');

    notifyListeners();
  }

  void addTag(String tag) {
    selectedTags.add(tag);
  }

  void deleteTag(String tag) {
    selectedTags.remove(tag);
  }

  void removeTags() {
    selectedTags.clear();
  }

  void clearSearch() {
    filteredProducts.clear();
    filteredProducts.addAll(products);
    searchController.clear();
    notifyListeners();
  }

  @override
  Future<void> loadProducts() async {
    isLoading = true;
    hasError = false;
    errorMessage = '';
    notifyListeners();

    final url = Uri.parse(productsUrl);
    final response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        final productsJson = json['products'] as List<dynamic>;

        products.clear();
        for (final product in productsJson) {
          products.add(Product.fromJson(product as Map<String, dynamic>));
        }
      } else if (response.statusCode == 404) {
        throw Exception('Page not found');
      } else if (response.statusCode == 401) {
        throw Exception('Access not allowed');
      } else {
        throw Exception(
          'An error occurred while trying to fetch the products data',
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
