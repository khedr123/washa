import 'package:carservice/screens/vendororuserlogin/view.dart';
import 'package:flutter/material.dart';

import '../vendor/view.dart';

class AfterSplash extends StatefulWidget {
  const AfterSplash({Key? key}) : super(key: key);

  @override
  State<AfterSplash> createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 163,
              ),
              Image.asset(
                'assets/images/aftersplash.jpg',
                width: 248,
                height: 156.06,
              ),
              const SizedBox(
                height: 194.94,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ), backgroundColor: const Color(0xff0D3C3C),

                  fixedSize: const Size(314, 44),
                ),
                onPressed: () {Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const VendorOrUserLogin(),
                  ),
                );},
                child: const Text(
                  "Login",
                  style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ), backgroundColor: const Color(0xff0D3C3C),

                  fixedSize: const Size(314, 44),
                ),
                onPressed: () {Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const VendorOrUserScreen(),
                  ),
                );},
                child: const Text(
                  "Sign Up",
                  style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 163,
              )
            ],
          ),
        ),
      ),
    );
  }
}
