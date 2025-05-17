import 'package:flutter/material.dart';
import 'package:web_store/model/cart_item.dart';
import 'package:web_store/view/widgets/base_image.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.cartItem});

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      /// Padding
      contentPadding: EdgeInsets.all(20),

      /// Item's image
      leading: BaseImage(imageUrl: cartItem.thumbnail),

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
          Text('Price: ${cartItem.price}'),
          Text('Quantity: ${cartItem.quantity}'),
          Text('Total: ${cartItem.total}'),
        ],
      ),
    );
  }
}
