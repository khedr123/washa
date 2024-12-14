import 'package:carservice/screens/resetpassword/view.dart';
import 'package:carservice/sharedwidgets/input.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart' as dio_package;

import '../../sharedwidgets/dio_helpers.dart';

class InstractionScreen extends StatefulWidget {
  const InstractionScreen({Key? key}) : super(key: key);

  @override
  State<InstractionScreen> createState() => _InstractionScreenState();
}

class _InstractionScreenState extends State<InstractionScreen> {
  final emailController = TextEditingController();
  bool loader = false;

  Future<void> instraction() async {
    try {
      setState(() {
        loader = true;
      });

      GetStorage getStorage = GetStorage();
      dio_package.Response response = await dio().post('password/forgetPassword',
          data: dio_package.FormData.fromMap({
            'email': emailController.text,
          }));
      getStorage.write('myUserData', response.data);
      print(response.data);
      setState(() {
        loader = false;
      });
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => ResetPassword()));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 98,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                Text(
                  'Reset password',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0D3C3C)),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                Text(
                  'Enter the email associated with your account and we\n will send an email with instructions to reset your\n password',
                  style: TextStyle(fontSize: 12, color: Color(0xff0D3C3C)),
                ),
              ],
            ),
            const SizedBox(
              height: 116,
            ),
            Image.asset(
              'assets/images/instraction.jpg',
              width: 246,
              height: 162,
            ),
            const SizedBox(height: 93),
            Input(
              label: 'Email Address',
              controller: emailController,
              myicon: const Icon(
                Icons.email,
                color: Color(0xff0D3C3C),
              ),
            ),
            const SizedBox(
              height: 79,
            ),
            loader
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: instraction,
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(188, 44), backgroundColor: const Color(0xff0D3C3C),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: const Text("Send Instructions"),
            )
          ],
        ),
      ),
    );
  }
}
