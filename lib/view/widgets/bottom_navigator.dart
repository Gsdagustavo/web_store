import 'package:flutter/material.dart';

/// A custom [BottomNavigatorBar] that contains the [HomePage], [ProfilePage],
/// [CartPage] and [SettingsPage] items
class MyBottomNavigatorBar extends StatefulWidget {
  const MyBottomNavigatorBar({super.key});

  @override
  State<MyBottomNavigatorBar> createState() => _MyBottomNavigatorBarState();
}

class _MyBottomNavigatorBarState extends State<MyBottomNavigatorBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

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
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      /// Allows adding more that 3 items to the bar
      type: BottomNavigationBarType.fixed,

      currentIndex: _selectedIndex,

      /// When an [Item] is tapped, the onTap method will push the selected
      /// page
      onTap: _onItemTapped,

      /// Defines the pages icons and labels
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }
}
