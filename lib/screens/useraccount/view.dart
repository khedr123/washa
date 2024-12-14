import 'package:carservice/screens/splash/view.dart';
import 'package:carservice/sharedwidgets/cach_helper.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../callus/view.dart';
import '../modifyuser/view.dart';
import '../userhome/view.dart';

class UseraccountScreen extends StatelessWidget {
   UseraccountScreen({Key? key}) : super(key: key);
      GetStorage getStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
   
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 52,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ), backgroundColor: const Color(0xffEDEDED),
                  shadowColor: const Color(0xff000000),
                  fixedSize: const Size(314, 44),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const Ahahshas(),
                    ),
                  );
                },
                child: const Row(
                  children:  [
                    Icon(
                      Icons.account_circle_outlined,
                      color: Color(0xff0D3C3C),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Modify Profile',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff0D3C3C)),
                    ),
                    SizedBox(
                      width: 124,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(
                        0xff0D3C3C,
                      ),
                      size: (12),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ), backgroundColor: const Color(0xffEDEDED),
                    shadowColor: const Color(0xff000000),
                    fixedSize: const Size(314, 44),
                  ),
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(
                        Icons.visibility_off,
                        color: Color(0xff0D3C3C),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Modify Password",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0D3C3C)),
                      ),
                      SizedBox(
                        width: 105,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff0D3C3C),
                        size: (12),
                      )
                    ],
                  )),
              const SizedBox(
                height: 22,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ), backgroundColor: const Color(0xffEDEDED),
                    shadowColor: const Color(0xff000000),
                    fixedSize: const Size(314, 44),
                  ),
                  onPressed: () {Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const CallusScreen(),
                    ),
                  );},
                  child: const Row(
                    children: [
                      Icon(
                        Icons.wifi_calling_3_sharp,
                        color: Color(0xff0D3C3C),
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Text(
                        "Call Us",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0D3C3C)),
                      ),
                      SizedBox(
                        width: 158,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff0D3C3C),
                        size: (12),
                      )
                    ],
                  )),
              const SizedBox(
                height: 22,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ), backgroundColor: const Color(0xffEDEDED),
                    shadowColor: const Color(0xff000000),
                    fixedSize: const Size(314, 44),
                  ),
                  onPressed: () {
                     getStorage.remove('userId');
                     CacheHelper.clear();
                         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SplashScreen(),));
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.logout,
                        size: 25,
                        color: Color(
                          0xff0D3C3C,
                        ),
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Text(
                        "Log Out",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0D3C3C)),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff0D3C3C),
                        size: (12),
                      )
                    ],
                  )),
              const SizedBox(
                height: 101,
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/garages.png",
                      height: 264,
                      width: 300,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xff0D3C3C),
            ),
            onPressed: () { Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => const UserHomeScreen(),
              ),
            );}),
        title: const Text(
          "My Account",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff0D3C3C)),
        ),
      ),
    );
  }
}
