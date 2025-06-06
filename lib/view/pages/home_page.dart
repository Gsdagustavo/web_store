import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_store/controller/providers/products_provider.dart';
import 'package:web_store/view/pages/base_page.dart';

import '../widgets/product_card.dart';

/// Home page of the app. All the products will be shown in this screen
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Home Page',

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Consumer<ProductsProvider>(
          builder: (context, productsProvider, child) {
            return RefreshIndicator(
              onRefresh: productsProvider.searchProducts,
              child: Column(
                children: [
                  /// Text field to search products
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: TextField(
                      controller: productsProvider.searchController,
                      onChanged:
                          (_) async => await productsProvider.searchProducts(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: IconButton(
                          onPressed: productsProvider.clearSearch,
                          icon: Icon(Icons.clear),
                        ),
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: Theme.of(context).focusColor,
                        ),
                      ),
                    ),
                  ),

                  /// Builder to show the products
                  Builder(
                    builder: (context) {
                      /// Shows to the user if any error has occurred
                      if (productsProvider.hasError) {
                        return Center(
                          child: Text(
                            'An error occurred while loading the products: ${productsProvider.errorMessage}',
                            style: TextStyle(color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                        );
                      }

                      /// Shows a [CircularProgressIndicator] while the products
                      /// are being loaded
                      if (productsProvider.isLoading) {
                        return Center(child: const CircularProgressIndicator());
                      }

                      final products = productsProvider.filteredProducts;

                      if (products.isEmpty) {
                        return Center(child: Text('No products were found'));
                      }

                      return Expanded(
                        child: ListView.separated(
                          separatorBuilder:
                              (context, index) => const SizedBox(height: 15),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];

                            return ProductCard(product: product);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
