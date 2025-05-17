import 'package:flutter/material.dart';

/// A custom [BottomNavigatorBar] that contains the [HomePage], [ProfilePage],
/// [CartPage] and [SettingsPage] items
class MyBottomNavigatorBar extends StatelessWidget {
  const MyBottomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      /// Defines the pages icons and labels
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],

      /// When an [Item] is tapped, the onTap method will push the selected
      /// page
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/homePage');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/cartPage');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/profilePage');
            break;
          case 3:
            Navigator.pushReplacementNamed(context, '/settingsPage');
            break;
        }
      },
    );
  }
}
