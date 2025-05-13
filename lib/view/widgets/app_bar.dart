import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_store/controller/providers/theme_provider.dart';

/// Custom app bar that contains a button to toggle the app's theme
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,

      actions: [
        Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            /// Toggles the current theme when pressed
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                onPressed: () => themeProvider.toggleTheme(),

                /// If the app is in dark mode, shows the dark mode icon
                /// otherwise, shows the light mode icon
                icon: Icon(
                  themeProvider.isLightTheme
                      ? Icons.light_mode
                      : Icons.dark_mode,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
