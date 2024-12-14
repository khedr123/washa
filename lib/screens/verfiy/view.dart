import 'package:carservice/sharedwidgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 43,
              ),
              const Text(
                'Verify Your Email',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0D3C3C)),
              ),
              const SizedBox(
                height: 86,
              ),
              Image.asset(
                'assets/images/verify.jpg',
                width: 214,
                height: 154,
              ),
              const SizedBox(
                height: 64,
              ),
              const Text('Please Enter The 4 Digit Code Sent To \nYour Account ',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0D3C3C))),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: const Color(0xffD9D9D9),
                    ),
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      cursorColor: const Color(0xff0D3C3C),
                      cursorHeight: 20,
                      decoration: const InputDecoration(
                          prefixStyle: TextStyle(color: Color(0xff0D3C3C)),
                          border: InputBorder.none),
                      style: Theme.of(context).textTheme.titleLarge,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 9,
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: const Color(0xffD9D9D9),
                    ),
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      cursorColor: const Color(0xff0D3C3C),
                      cursorHeight: 20,
                      decoration: const InputDecoration(
                          prefixStyle: TextStyle(color: Color(0xff0D3C3C)),
                          border: InputBorder.none),
                      style: Theme.of(context).textTheme.titleLarge,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 9,
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: const Color(0xffD9D9D9),
                    ),
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      cursorColor: const Color(0xff0D3C3C),
                      cursorHeight: 20,
                      decoration: const InputDecoration(
                          prefixStyle: TextStyle(color: Color(0xff0D3C3C)),
                          border: InputBorder.none),
                      style: Theme.of(context).textTheme.titleLarge,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 9,
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: const Color(0xffD9D9D9),
                    ),
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      cursorColor: const Color(0xff0D3C3C),
                      cursorHeight: 20,
                      style: Theme.of(context).textTheme.titleLarge,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: const InputDecoration(
                          prefixStyle: TextStyle(color: Color(0xff0D3C3C)),
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Resent code',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff0D3C3C)),
                  )),
              const SizedBox(
                height: 159,
              ),
              const Button(label: 'Verify', lengh: 203, width: 44),
              const SizedBox(
                height: 94,
              )
            ],
          )),
    );
  }
}
