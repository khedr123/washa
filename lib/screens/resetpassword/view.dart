import 'package:carservice/sharedwidgets/button.dart';
import 'package:flutter/material.dart';

import '../../sharedwidgets/input.dart';



class ResetPassword extends StatelessWidget {
  ResetPassword({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final otpController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text('Create New Password',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff0D3C3C),
              )),
          const SizedBox(
            height: 5,
          ),
          const Text('your new password must be\n diferrent from previos password.',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff0D3C3C),
              )),
          const SizedBox(
            height: 16,
          ),
          Image.asset(
            'assets/images/resetpassword.jpg',
            width: 228,
            height: 259,
          ),
          const SizedBox(
            height: 16,
          ),
          Input(
              label: 'Email',
              myicon: const Icon(Icons.email, color: Color(0xff0D3C3C)),
              controller: emailController,
              keyboardType: TextInputType.emailAddress),
          const SizedBox(
            height: 26,
          ),
          Input(
            label: 'OTP',
            controller: otpController,
            keyboardType: TextInputType.number,
          ),const SizedBox(
            height: 26,
          ),
          Input(
            label: 'password',
            controller: passwordController,
            isPassword: true,
          ),
          const SizedBox(
            height: 26,
          ),
          Input(
            label: 'Confirm password',
            controller: confirmPasswordController,
            isPassword: true,
          ),
          const SizedBox(
            height: 128,
          ),
          const Button(label: 'Reset Password', lengh: 314, width: 44)
        ],
      ),
    ));
  }
}
