import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

navigateTo({required context, required Widget page, bool withHistory = true}) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (route) => withHistory);
}
