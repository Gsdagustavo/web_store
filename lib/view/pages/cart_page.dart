import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_store/controller/providers/cart_provider.dart';
import 'package:web_store/view/pages/base_page.dart';
import 'package:web_store/view/widgets/cart_item_card.dart';

import '../../controller/providers/login_provider.dart';

/// This is a page that returns a [BasePage] containing infos about the logged
/// user's shopping cart
///
/// To show the products, a [ListView] is used with [CartItemCard] as ListTiles
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      /// Title that will be shown on the AppBar
      title: 'Cart',

      /// Consumes both [CartProvider] and [LoginProvider] to keep track
      /// of the current cart and logged user
      body: Consumer2<CartProvider, LoginProvider>(
        builder: (context, cartProvider, loginProvider, child) {
          if (cartProvider.isLoading) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading your awesome choices...'),

                  const SizedBox(height: 20),

                  CircularProgressIndicator(),
                ],
              ),
            );
          }

          /// Stores the instance of the Cart given by the provider
          final cart = cartProvider.cart;

          /// If the cart is null (no products), a message is shown
          if (cart == null || cart.products.isEmpty) {
            return Center(child: Text('No products in the cart yet!'));
          }

          /// Stores the products from the cart
          final products = cartProvider.cart!.products;

          /// The user can refresh the products by scrolling upwards
          return RefreshIndicator(
            onRefresh: () async {
              await cartProvider.loadCart(userId: loginProvider.loggedUser!.id);
            },

            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// ListView containing infos about all products in the cart
                  ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return CartItemCard(cartItem: product);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 20);
                    },
                    itemCount: products.length,
                  ),

                  /// Infos about the number of products and total items
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Products: ${cart.totalProducts}',
                          style: TextStyle(fontSize: 18),
                        ),

                        Text(
                          'Quantity: ${cart.totalQuantity}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),

                  /// Total price of the cart
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Total: \$ ${cart.total.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),

                  /// Button that should call the payment logic
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Pay with credit card',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
