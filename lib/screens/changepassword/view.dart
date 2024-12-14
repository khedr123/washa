import 'package:carservice/sharedwidgets/input.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 38,
              ),
              const Text(
                'Change Password',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0D3C3C)),
              ),
              const SizedBox(
                height: 27,
              ),
              Image.asset(
                'assets/images/changepassword.jpg',
                width: 100,
                height: 100,
              ),
              const SizedBox(
                height: 33,
              ),
              const Text(
                'Enter New Password',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0D3C3C)),
              ),
              const SizedBox(
                height: 34,
              ),
              Input(
                label: 'Current password',
                controller: currentPasswordController,
                isPassword: true,
              ),
              const SizedBox(
                height: 12,
              ),
              Input(
                label: 'Current password',
                controller: newPasswordController,
                isPassword: true,
              ),
              const SizedBox(
                height: 12,
              ),
              Input(
                label: 'Confirm password',
                controller: confirmPasswordController,
                isPassword: true,
              ),
              const SizedBox(
                height: 104,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ), backgroundColor: const Color(0xff0D3C3C),

                  fixedSize: const Size(314, 44),
                ),
                onPressed: () {},
                child: const Text(
                  "Login",
                  style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 217,
              )
            ],
          )),
    );
  }
}
