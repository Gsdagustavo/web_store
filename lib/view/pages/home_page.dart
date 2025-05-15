import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_store/controller/providers/products_provider.dart';
import 'package:web_store/view/widgets/app_bar.dart';

import '../widgets/product_card.dart';

/// Home page of the app. All the products will be shown in this screen
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Home page'),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Consumer<ProductsProvider>(
          builder: (context, productsProvider, child) {
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

            final products = productsProvider.products;

            if (products.isEmpty) {
              return Center(child: Text('No products were found'));
            }

            return RefreshIndicator(
              onRefresh: () async {
                await productsProvider.loadProducts();
              },

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
      ),
    );
  }
}
