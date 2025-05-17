import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_store/controller/providers/login_provider.dart';
import 'package:web_store/view/pages/base_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Settings',
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Icon(Icons.settings, size: 80)),

            const SizedBox(height: 50),

            Text(
              'General',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            const SizedBox(height: 25),

            /// Profile card
            Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {
                  Navigator.pushNamed(context, '/profilePage');
                },
              ),
            ),

            const SizedBox(height: 10),

            /// Logout card
            Card(
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  Provider.of<LoginProvider>(context, listen: false).logout();
                  Navigator.pushReplacementNamed(context, '/loginPage');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
