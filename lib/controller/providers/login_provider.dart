import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_store/constants/shared_preferences_keys.dart';
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

  String? errorMessage;

  bool get isLoggedIn => loginToken.trim().isNotEmpty;

  /// Receives a [username] and a [password] and try to login using these credentials
  Future<void> login({
    required String username,
    required String password,
  }) async {
    isLoading = true;
    errorMessage = null;

    final loginMap = {'username': username.trim(), 'password': password.trim()};

    try {
      final response = await http.post(Uri.parse(loginUrl), body: loginMap);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        loginToken = data['accessToken'];

        await _saveUser(token: loginToken);
        debugPrint('user with token $loginToken saved to shared preferences');
      } else if (response.statusCode == 404) {
        errorMessage = 'Page not found';
      } else if (response.statusCode == 401) {
        errorMessage = 'Incorrect Username or Password';
      } else {
        errorMessage = 'An error occurred while trying to login';
      }
    } catch (e) {
      errorMessage = 'Connection error';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadUser() async {
    isLoading = true;
    final prefs = await SharedPreferences.getInstance();
    final savedToken = prefs.getString(loggedUserTokenKey);

    if (savedToken != null) {
      loginToken = savedToken;
    }

    notifyListeners();
  }

  /// Saves a user [token] to the [SharedPreferences] in the [loggedUserTokenKey] key
  Future<void> _saveUser({required String token}) async {
    isLoading = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(loggedUserTokenKey, token);
    isLoading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    isLoading = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(loggedUserTokenKey, '');
    loginToken = '';
    isLoading = false;
    notifyListeners();
  }
}
