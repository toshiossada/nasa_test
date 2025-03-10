import 'package:flutter/material.dart';

Widget makeTestableWidget({
  required Widget home,
  NavigatorObserver? navigatorObserver,
}) {
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  final navigatorKey = GlobalKey<NavigatorState>();
  final navigatorObservers = <NavigatorObserver>[];
  if (navigatorObserver != null) navigatorObservers.add(navigatorObserver);

  return MaterialApp(
    scaffoldMessengerKey: scaffoldMessengerKey,
    navigatorKey: navigatorKey,
    navigatorObservers: navigatorObservers,
    home: home,
  );
}
