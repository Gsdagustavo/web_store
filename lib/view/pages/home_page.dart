import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_store/controller/providers/products_provider.dart';
import 'package:web_store/view/widgets/app_bar.dart';

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
            final products = productsProvider.products;

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

                  return ListTile(
                    title: Text(product.title),

                    subtitle: Text(
                      product.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),

                    leading: Image.network(product.images[0]),
                    contentPadding: EdgeInsets.all(10),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
