import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_store/view/pages/base_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Cart',
      body: Center(child: Text('Shopping cart!')),
    );
  }
}
