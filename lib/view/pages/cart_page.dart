import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_store/controller/providers/cart_provider.dart';
import 'package:web_store/view/pages/base_page.dart';
import 'package:web_store/view/widgets/cart_item_card.dart';

import '../../controller/providers/login_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Cart',
      body: Consumer2<CartProvider, LoginProvider>(
        builder: (context, cartProvider, loginProvider, child) {
          final products = cartProvider.cart!.products;

          return Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await cartProvider.loadCart(
                  userId: loginProvider.loggedUser!.id,
                );
              },

              child: ListView.separated(
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
          );
        },
      ),
    );
  }
}
