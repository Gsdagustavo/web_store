import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_store/controller/providers/cart_provider.dart';
import 'package:web_store/model/cart_item.dart';
import 'package:web_store/view/pages/base_page.dart';
import 'package:web_store/view/widgets/base_image.dart';

import '../../model/product_model.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: product.title,
      useNavigator: true,

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: BaseImage(imageUrl: product.thumbnail)),

            const SizedBox(width: 20),

            Expanded(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(product.description, style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ),

            Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                return IconButton(
                  onPressed: () {
                    cartProvider.addItem(
                      cartItem: CartItem.fromProduct(product),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Product added to the cart!')),
                    );
                  },

                  icon: Icon(Icons.shopping_cart),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
