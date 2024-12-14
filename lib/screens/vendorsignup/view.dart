import 'package:carservice/screens/loginvendor/view.dart';
import 'package:carservice/screens/vendor/view.dart';
import 'package:carservice/sharedwidgets/dio_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../sharedwidgets/input.dart';
import 'package:dio/dio.dart' as dio_package;

import '../map.dart';

class VendorSignUpScreen extends StatefulWidget {
  const VendorSignUpScreen({Key? key}) : super(key: key);

  @override
  State<VendorSignUpScreen> createState() => _VendorSignUpScreenState();
}

class _VendorSignUpScreenState extends State<VendorSignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool loader = false;

  Future<void> register() async {
    try {
      String name = _nameController.text;
      String email = _emailController.text;

      String password = _passwordController.text;
      String confirmPassword = _confirmPasswordController.text;
      setState(() {
        loader = true;
      });

      GetStorage getStorage = GetStorage();
      dio_package.Response response = await dio().post('Register1',
          data: dio_package.FormData.fromMap({
            'name':name,
            'email': email,
            'password': password,
            'password_confirmation': confirmPassword,
            'location':'${getStorage.read('long') ?? 00000},${getStorage.read('lat') ?? 00000000}',
            'type':_selectedValue

          }));
      getStorage.write('myUserData', response.data);
      print(response.data);
      setState(() {
        loader = false;
      });
      Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => const LoginVendorScreen()));
    } catch (e) {
      print(e.toString());
      setState(() {
        loader = false;
      });
    }
  }

  void myData() {
    GetStorage getStorage = GetStorage();
    String category = getStorage.read('myUserData')['token'];

    print(category);
  }

  String? _selectedValue;

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
              const Text(
                'Sign up',
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff0D3C3C),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 11,
              ),
              Image.asset(
                'assets/images/vendersignup.jpg',
                width: 188,
                height: 174,
              ),
              const SizedBox(
                height: 35,
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
                  myicon: const Icon(Icons.visibility_off, color: Color(0xff0D3C3C)),
                  controller: _passwordController,
                  keyboardType: TextInputType.text),
              const SizedBox(
                height: 21,
              ),
              Input(
                  label: 'Confirm Passowrd',
                  isPassword: true,
                  myicon: const Icon(Icons.visibility_off, color: Color(0xff0D3C3C)),
                  controller: _confirmPasswordController,
                  keyboardType: TextInputType.text),
              const SizedBox(
                height: 22,
              ),
              Container(
                  height: 44,
                  width: 314,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xffEDEDED)),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => const MapSample(),
                            ));
                          },
                          icon: const Icon(Icons.my_location,
                              color: Color(0xff0D3C3C))),
                      const Text(
                        'Location',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      )
                    ],
                  )),
              const SizedBox(
                height: 22,
              ),
              Container(
                height: 44,
                width: 314,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xffEDEDED)),
                child: DropdownButton<String>(
                  underline: Container(
                    height: 0,
                  ),
                  hint: const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Text(
                      'Type',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff0D3C3C)),
                    ),
                  ),
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 200.0),
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xff0D3C3C),
                    ),
                  ),
                  value: _selectedValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedValue = newValue!;
                    });
                  },
                  items: usersType
                      .map<DropdownMenuItem<String>>((UsersType value) {
                    return DropdownMenuItem<String>(
                      value: value.id,
                      child: Text(value.name),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              loader
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: register,
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(239, 39), backgroundColor: const Color(0xff0D3C3C),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: const Text("Create Account"),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class UsersType {
  final String name;

  final String id;

  UsersType(this.name, this.id);
}

List<UsersType> usersType = [
  UsersType('Garage', '1'),
  UsersType('Washing', '2'),
];
class Loop{
  late int i ;

}
