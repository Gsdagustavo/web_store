import 'package:flutter/material.dart';

import '../../model/product_model.dart';

/// A card to show a product's basic information
class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      /// Main column
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (product.images.first != null &&
                product.images.first!.isNotEmpty)
              Container(
                height: 150,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 16),
                child: Image.network(
                  product.images.first!,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }

                    return const Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Icon(Icons.image_not_supported));
                  },
                ),
              ),

            /// Row with the product's title and the price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.title,
                  style: TextStyle(fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),

                Text(
                  '\$ ${product.price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 14, color: Colors.green.shade400),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),

            /// Spacing between the title and the description
            const SizedBox(height: 13),

            /// Row with the product's description and stock infos
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Expanded to avoid text overflow
                Expanded(
                  child: Text(
                    product.description,
                    style: TextStyle(fontSize: 14, color: Colors.grey),

                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),

                Text(
                  'Stock: ${product.stock.toString()}',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
