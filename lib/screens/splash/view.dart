import 'dart:async';

import 'package:carservice/screens/aftersplash/view.dart';
import 'package:carservice/sharedwidgets/cach_helper.dart';
import 'package:flutter/material.dart';

import '../../sharedwidgets/helper_methods.dart';
import '../userhome/view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      navigateTo(
          context: context,
          page: CacheHelper.getIfFirstTime() && CacheHelper.getToken().isEmpty
              ? const AfterSplash()
              : const UserHomeScreen(),
          withHistory: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset('assets/images/splash.png')],
      ),
    );
  }
}
