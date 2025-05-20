import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_store/controller/providers/cart_provider.dart';
import 'package:web_store/model/cart_item.dart';
import 'package:web_store/view/widgets/base_image.dart';

/// This class represents a [ListTile} that exhibits information about a
/// product or array of products of a [Cart]
class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.cartItem});

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      /// Item's image
      /// todo: remove hardcoded sizes for the image
      leading: SizedBox(
        width: 60,
        height: 60,
        child: BaseImage(imageUrl: cartItem.thumbnail),
      ),

      /// Item's title
      title: Text(cartItem.title),

      /// Item's price, quantity and total price
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Price: \$ ${cartItem.price.toStringAsFixed(2)}'),
          Text('Quantity: ${cartItem.quantity}'),
          Text('Total: ${cartItem.total.toStringAsFixed(2)}'),
        ],
      ),

      trailing: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed:
                    () => cartProvider.addItem(cartItem: cartItem),
                icon: Icon(Icons.add),
              ),

              /// button to remove an unit of the item
              IconButton(
                onPressed: () {
                  if (cartItem.quantity == 1) {
                    showDialog(
                      context: context,
                      builder: (context) {

                        /// [AlertDialog] to confirm the deletion of a product
                        return AlertDialog(
                          title: Text('Remove Item'),
                          content: Text(
                            'Are you sure you want to remove this item from the cart?',
                          ),

                          actions: [
                            TextButton(
                              onPressed: Navigator.of(context).pop,
                              child: Text('Cancel'),
                            ),

                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                cartProvider.removeItem(cartItem: cartItem);
                              },
                              child: Text('Remove'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    cartProvider.removeItem(cartItem: cartItem);
                  }
                },
                icon: Icon(Icons.remove),
              ),

              /// button to remove an item
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Remove Item'),
                        content: Text(
                          'Are you sure you want to remove this item from the cart?',
                        ),

                        actions: [
                          TextButton(
                            onPressed: Navigator.of(context).pop,
                            child: Text('Cancel'),
                          ),

                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              cartProvider.deleteItem(cartItem: cartItem);
                            },
                            child: Text('Remove'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: Icon(Icons.clear),
              ),
            ],
          );
        },
      ),

      /// Background color
      tileColor: Theme.of(context).cardColor,
    );
  }
}
