import 'package:flutter/material.dart';
import 'package:web_store/view/widgets/product_image.dart';

import '../../model/product_model.dart';

/// A card to show a product's basic information
class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Navigator.pushNamed(
            context,
            '/productDetails',
            arguments: product,
          ),
      child: Card(
        /// Main column
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (product.images.first != null &&
                  product.images.first!.isNotEmpty)
                ProductImage(imageSrc: product.images.first),

              /// Row with the product's title and the price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      product.title,
                      style: TextStyle(fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),

                  Text(
                    '\$ ${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.green.shade400,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),

              /// Spacing between the title and the description
              const SizedBox(height: 13),

              /// Row with the product's description and stock infos
              Row(
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
      ),
    );
  }
}
