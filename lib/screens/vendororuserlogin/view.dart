import 'package:carservice/screens/loginuser/view.dart';
import 'package:carservice/screens/loginvendor/view.dart';
import'package:flutter/material.dart';

import '../aftersplash/view.dart';
class VendorOrUserLogin extends StatelessWidget {
  const VendorOrUserLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xff0D3C3C)),
          onPressed: () {Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const AfterSplash(),
            ),
          );},
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 138,
              ),
              Image.asset(
                'assets/images/vendor.jpg',
                width: 220,
                height: 220,
              ),
              const SizedBox(
                height: 165,
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
                    builder: (BuildContext context) => const LoginUserScreen(),
                  ),
                );},
                child: const Text(
                  "User",
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
                    builder: (BuildContext context) => const LoginVendorScreen(),
                  ),
                );},
                child: const Text(
                  "Vendor",
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