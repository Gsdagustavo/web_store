import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_store/controller/providers/cart_provider.dart';
import 'package:web_store/model/cart_item.dart';
import 'package:web_store/view/widgets/base_image.dart';

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
              Wrap(
                direction: Axis.horizontal,
                children: [
                  /// button to add an unit of the item
                  IconButton(
                    onPressed: () => cartProvider.addItem(cartItem: cartItem),
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ],
          );
        },
      ),

      // /// Background color
      tileColor: Theme.of(context).cardColor,
    );
  }
}
