import 'package:flutter/material.dart';
import 'package:web_store/view/widgets/app_bar.dart';
import 'package:web_store/view/widgets/forms_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: const MyAppBar(title: 'Login'),
        body: Padding(
          padding: const EdgeInsets.all(16.0),

          /// Forms
          child: const FormsWidget(),
        ),
      ),
    );
  }
}
