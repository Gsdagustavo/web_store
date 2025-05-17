import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_store/core/keys/navigator_key.dart';

import '../../core/constants/shared_preferences_keys.dart';
import '../../core/constants/urls.dart';
import '../../model/user_model.dart';
import 'cart_provider.dart';

/// Provider that contains a Login method and has login attributes,
/// such as [loginToken] and [username]
class LoginProvider with ChangeNotifier {
  /// Whether the provider is making any external API call
  bool isLoading = false;

  /// Login credentials
  ///
  /// If the Strings are empty, then no user is logged in
  User? loggedUser;
  String? token;
  String? errorMessage;

  bool get isLoggedIn => loggedUser != null;

  /// Receives a [username] and a [password] and try to login using these credentials
  Future<void> login({
    required String username,
    required String password,
  }) async {
    isLoading = true;
    errorMessage = null;

    debugPrint('Username: $username., password: $password');

    final loginMap = {'username': username.trim(), 'password': password.trim()};

    try {
      final response = await http.post(Uri.parse(loginUrl), body: loginMap);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        loggedUser = User(
          id: data['id'],
          firstName: data['firstName'],
          lastName: data['lastName'],
          username: data['username'],
          accessToken: data['accessToken'],
          email: data['email'],
          image: data['image'],
        );

        await _saveUser();
        await loadUser();
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

    if (savedToken != null && savedToken.isNotEmpty) {
      try {
        final headers = {'Authorization': 'Bearer $savedToken'};

        final response = await http.get(
          Uri.parse(loginAuthUrl),
          headers: headers,
        );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          loggedUser = User.fromJson(data, accessToken: savedToken);

          final cartProvider = Provider.of<CartProvider>(
            navigatorKey.currentContext!,
            listen: false,
          );

          await cartProvider.loadCart(userId: loggedUser!.id);

          debugPrint('USER LOADED: ${loggedUser.toString()}');
        }
      } catch (e) {
        errorMessage = e.toString();
      } finally {
        isLoading = false;
        notifyListeners();
      }
    }

    notifyListeners();
  }

  /// Saves a user [token] to the [SharedPreferences] in the [loggedUserTokenKey] keyFuture<void> _saveUser({required String token}) async {isLoading = true;
  Future<void> _saveUser() async {
    isLoading = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(loggedUserTokenKey, loggedUser!.accessToken);
    isLoading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    isLoading = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(loggedUserTokenKey, '');
    token = null;
    loggedUser = null;
    isLoading = false;
    notifyListeners();
  }
}
