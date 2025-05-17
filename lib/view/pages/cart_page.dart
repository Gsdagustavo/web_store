import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_store/controller/providers/cart_provider.dart';
import 'package:web_store/view/pages/base_page.dart';
import 'package:web_store/view/widgets/cart_item_card.dart';

import '../../controller/providers/login_provider.dart';

/// This is a page that returns a [BasePage] containing infos about the logged
/// user's shopping cart
///
/// To show the products, a [LisView] is used with [CartItemCard] as LisTiles
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

          final cart = cartProvider.cart;

          if (cart == null) {
            return Center(child: Text('No products in the cart yet!'));
          }

          final products = cartProvider.cart!.products;

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
                  Expanded(
                    child: ListView.separated(
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
                  ),

                  /// Infos about the number of products and total items
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Products: ${cart!.totalProducts}',
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
                      'Total: \$ ${cart.total}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),

                  /// Button that should call the payment logic
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Pay with credit card',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
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
