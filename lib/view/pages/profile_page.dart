import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_store/controller/providers/login_provider.dart';
import 'package:web_store/view/pages/base_page.dart';

import '../../model/user_model.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Profile',
      body: Consumer<LoginProvider>(
        builder: (context, loginProvider, child) {
          final User user = loginProvider.loggedUser!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                /// User's images
                Center(
                  child: CircleAvatar(
                    radius: 75,
                    child: Image.network(
                      user.image,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress != null) {
                          return CircularProgressIndicator();
                        }

                        return child;
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Text(
                          'Error: $error',
                          style: TextStyle(color: Colors.red),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                /// Users's name
                Text(
                  'Hello, ${user.firstName} ${user.lastName}!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 15),

                /// Users's email
                Text(user.email),
              ],
            ),
          );
        },
      ),
    );
  }
}
