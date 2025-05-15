import 'package:flutter/material.dart';
import 'package:web_store/view/widgets/app_bar.dart';
import 'package:web_store/view/widgets/product_image.dart';

import '../../model/product_model.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: product.title),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: ProductImage(imageSrc: product.images.first)),

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

            IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
          ],
        ),
      ),
    );
  }
}
