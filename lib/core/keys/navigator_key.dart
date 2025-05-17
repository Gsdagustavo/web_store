import 'package:flutter/cupertino.dart';

/// Global Key to handle context interactions in scenarios where there is no
/// context, such as in providers functions
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
