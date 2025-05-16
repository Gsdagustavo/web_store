import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/providers/login_provider.dart';

class FormsWidget extends StatefulWidget {
  const FormsWidget({super.key});

  @override
  State<FormsWidget> createState() => _FormsWidgetState();
}

class _FormsWidgetState extends State<FormsWidget> {
  /// Whether the password text should be hidden or not
  bool obscurePassword = true;

  /// forms
  final formKey = GlobalKey<FormState>();

  /// Text controllers
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  /// Validates the [username] on the [validator] of username text field
  String? nameValidator(String? username) {
    if (username == null || username.isEmpty) {
      return 'Invalid username';
    }

    return null;
  }

  /// Validates the [password] on the [validator] of password text field
  String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return 'Invalid password';
    }

    return null;
  }

  /// Try to validate the forms and calls the login provider
  void sendForms() async {
    if (formKey.currentState!.validate()) {
      final provider = Provider.of<LoginProvider>(context, listen: false);

      try {
        await provider.login(
          username: nameController.text,
          password: passwordController.text,
        );

        if (provider.loggedUser != null) {
          Navigator.pushReplacementNamed(context, '/homePage');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(provider.errorMessage!),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Something went wrong!')));
      }
    }

    setState(() {
      nameController.clear();
      passwordController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,

      child: Center(
        /// Contains the text fields and the login button
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Username text field
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: nameController,
              validator: nameValidator,

              decoration: InputDecoration(
                label: Text('Username'),
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            /// Password text field
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: passwordController,
              validator: passwordValidator,
              obscureText: obscurePassword,

              decoration: InputDecoration(
                label: Text('Password'),
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  /// hide and show password toggling
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },

                  /// Hide or Show password icon
                  icon: Icon(
                    obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            /// Login button
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Consumer<LoginProvider>(
                    builder: (context, value, child) {
                      return ElevatedButton(
                        onPressed: sendForms,
                        child: Text('Login'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
