import 'package:flutter/material.dart';
import 'package:web_store/model/cart_item.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.cartItem});

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      /// Item's image
      ///
      /// OBS: Due to a layout error, using the image as the leading of the
      /// tile causes the page to become blank and crashing the app
      ///
      /// todo: fix this in the future
      // leading: BaseImage(imageUrl: cartItem.thumbnail),

      /// Item's title
      title: Text(cartItem.title),

      /// Icon that simulates a "remove" button
      trailing: Icon(Icons.clear),

      /// Background color
      tileColor: Theme.of(context).cardColor,

      /// Item's price, quantity and total price
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Price: \$ ${cartItem.price.toStringAsFixed(2)}'),
          Text('Quantity: ${cartItem.quantity}'),
          Text('Total: ${cartItem.total}'),
        ],
      ),
    );
  }
}
