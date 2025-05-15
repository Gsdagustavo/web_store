import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:web_store/constants/urls.dart';

/// Provider that contains a Login method and has login attributes,
/// such as [loginToken] and [username]
class LoginProvider with ChangeNotifier {
  /// Whether the provider is making any external API call
  bool isLoading = false;

  /// Login credentials
  ///
  /// If the Strings are empty, then no user is logged in
  String loginToken = '';
  String username = '';

  /// Receives a [username] and a [password] and try to login using these credentials
  Future<void> login({
    required String username,
    required String password,
  }) async {
    isLoading = true;

    final loginMap = {'username': username.trim(), 'password': password.trim()};
    final response = await http.post(Uri.parse(loginUrl), body: loginMap);

    isLoading = false;
    notifyListeners();

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      loginToken = data['accessToken'];
      username = data['username'];
    } else if (response.statusCode == 404) {
      throw Exception('Page not found');
    } else if (response.statusCode == 401) {
      throw Exception('Access not allowed');
    } else {
      throw Exception('An error occurred while trying to login');
    }
  }
}
