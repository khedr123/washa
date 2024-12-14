import 'package:carservice/screens/userhome/view.dart';
import 'package:carservice/screens/vendororuserlogin/view.dart';
import 'package:carservice/sharedwidgets/cach_helper.dart';
import 'package:carservice/sharedwidgets/input.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio_package;
import 'package:get_storage/get_storage.dart';
import '../../sharedwidgets/dio_helpers.dart';
import '../instraction/view.dart';
class LoginUserScreen extends StatefulWidget {
  const LoginUserScreen({Key? key}) : super(key: key);

  @override
  State<LoginUserScreen> createState() => _LoginUserScreenState();
}

class _LoginUserScreenState extends State<LoginUserScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool loading = false;
  bool isPassShown = true;

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      try {
        setState(() {
          loading = true;
        });

        GetStorage getStorage = GetStorage();
        dio_package.Response response = await dio().post(
          'login',
          data: dio_package.FormData.fromMap({
            'email': emailController.text,
            'password': passwordController.text,
          }),
        );
        if(response.statusCode == 200 ){
        CacheHelper.saveToken(response.data['token']);

        }

        getStorage.write('myUserData', response.data);
        getStorage.write('userId', response.data['id']);
        print(response.data);
        setState(() {
          loading = false;
        });

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => const UserHomeScreen(),
          ),
        );
      } catch (e) {
        print(e.toString());
        setState(() {
          loading = false;
        });
      }
    }
  }

  void myData() {
    GetStorage getStorage = GetStorage();
    String category = getStorage.read('myUserData')['token'];
    print(category);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xff0D3C3C),
            ),
            onPressed: () {Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => const VendorOrUserLogin(),
              ),
            );}),
        title: const Text(
          "Login",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff0D3C3C)),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 43,
                ),

                const SizedBox(
                  height: 15,
                ),
                Image.asset(
                  'assets/images/login.jpg',
                  width: 260,
                  height: 244,
                ),
                const SizedBox(
                  height: 76,
                ),
                Input(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    } else {
                      return null;
                    }
                  },
                  label: 'Email',
                  myicon: const Icon(Icons.email, color: Color(0xff0D3C3C)),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 22,
                ),
                Input(
                    label: 'Password',
                    isPassword: true,
                    myicon:
                    const Icon(Icons.visibility_off, color: Color(0xff0D3C3C)),
                    controller: passwordController,
                    keyboardType: TextInputType.text),
                const SizedBox(
                  height: 36,
                ),
                TextButton(
                  onPressed: () {Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const InstractionScreen(),
                    ),
                  );},
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0D3C3C),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 90,
                ),
                loading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ), backgroundColor: const Color(0xff0D3C3C),

                    fixedSize: const Size(314, 44),
                  ),
                  onPressed: login,
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
