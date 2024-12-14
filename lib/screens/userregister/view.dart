
import 'package:carservice/screens/vendor/view.dart';
import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart' as dio_package;
import '../../sharedwidgets/dio_helpers.dart';
import '../../sharedwidgets/input.dart';
import '../loginuser/view.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({Key? key}) : super(key: key);

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool loader = false;

  Future<void> userRegister() async {
    try {
      String name = _nameController.text;
      String email = _emailController.text;

      String password = _passwordController.text;
      String confirmPassword = _confirmPasswordController.text;
      setState(() {
        loader = true;
      });

      GetStorage getStorage = GetStorage();
      dio_package.Response response = await dio().post('Register2',
          data: dio_package.FormData.fromMap({
            'name':name,
            'email': email,
            'password': password,
            'password_confirmation': confirmPassword,
            'location':'2345561'

          }));
      getStorage.write('myUserData', response.data);
      print(response.data);
      setState(() {
        loader = false;
      });
      Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => const LoginUserScreen()));
    } catch (e) {
      print(e.toString());
      setState(() {
        loader = false;
      });
    }
  }
  void myData(){
    GetStorage getStorage = GetStorage();
    String category =   getStorage.read('myUserData')['token'];

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
                builder: (BuildContext context) => const VendorOrUserScreen(),
              ),
            );}),
        title: const Text(
          "Sign Up",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff0D3C3C)),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 41,
              ),

              const SizedBox(
                height: 14,
              ),
              Image.asset(
                'assets/images/userregister.jpg',
                width: 222,
                height: 227,
              ),
              const SizedBox(
                height: 38,
              ),
              Input(
                  label: 'Name',
                  myicon: const Icon(Icons.account_circle_outlined,
                      color: Color(0xff0D3C3C)),
                  controller: _nameController,
                  validator: (String? val) {
                    if (val!.isEmpty) {
                      return ' Name is required';
                    } else if (val.length < 3) {
                      return ' name must be atleast 3 digits';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name),
              const SizedBox(
                height: 21,
              ),
              Input(
                  label: 'Email',
                  myicon: const Icon(Icons.email, color: Color(0xff0D3C3C)),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(
                height: 21,
              ),
              Input(
                  label: 'Password',
                  isPassword: true,
                  myicon:
                  const Icon(Icons.visibility_off, color: Color(0xff0D3C3C)),
                  controller: _passwordController,
                  keyboardType: TextInputType.text),
              const SizedBox(
                height: 21,
              ),
              Input(
                  label: 'Confirm Passowrd',
                  isPassword: true,
                  myicon:
                  const Icon(Icons.visibility_off, color: Color(0xff0D3C3C)),
                  controller: _confirmPasswordController,
                  keyboardType: TextInputType.text),
              const SizedBox(
                height: 67,
              ),
              loader? const CircularProgressIndicator(): ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ), backgroundColor: const Color(0xff0D3C3C),

                  fixedSize: const Size(314, 44),
                ),
                onPressed: userRegister,
                child: const Text(
                  "Create Account",
                  style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 96,
              )
            ],
          ),
        ),
      ),
    );
  }
}
