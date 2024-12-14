import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../sharedwidgets/button.dart';
import '../../sharedwidgets/input.dart';
import '../useraccount/view.dart';

class Ahahshas extends StatefulWidget {
  const Ahahshas({Key? key}) : super(key: key);

  @override
  _AhahshasState createState() => _AhahshasState();
}

class _AhahshasState extends State<Ahahshas> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myData();
  }

  void myData() {
    GetStorage getStorage = GetStorage();
    String name = getStorage.read('myUserData')['name'];
    String email = getStorage.read('myUserData')['email'];
    String category = getStorage.read('myUserData')['token'];
    print(category);


    setState(() {
      nameController.text = name ?? '';
      emailController.text = email ?? '';
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xff0D3C3C),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => UseraccountScreen (),
              ),
            );}),
        title: const Text(
          "Modify My Account",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      backgroundColor: const Color(0xff0D3C3C),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 37,
            ),

            const SizedBox(
              height: 10,
            ),
            Image.asset(
              'assets/images/Vector.png',
              width: 120,
              height: 120,
            ),
            const SizedBox(
              height: 14,
            ),
            Container(
              width: double.infinity,
              height: 755,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 29,
                  ),
                  const Text(
                    'Account Details',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color(0xff0D3C3C)),
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  Input(
                      label: 'Name',
                      myicon: const Icon(Icons.account_circle_outlined,
                          color: Color(0xff0D3C3C)),
                      controller: nameController,
                      validator: (String? val) {
                        if (val!.isEmpty) {
                          return ' Name is required';
                        } else if (val.length < 3) {
                          return ' name must be at least 3 digits';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name),
                  const SizedBox(
                    height: 17,
                  ),
                  Input(
                      label: 'email',
                      myicon: const Icon(Icons.email, color: Color(0xff0D3C3C)),
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 45,
                  ),
                  const Button(label: 'Save', lengh: 314, width: 44)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
