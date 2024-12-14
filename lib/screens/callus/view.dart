import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../sharedwidgets/dio_helpers.dart';
import 'package:dio/dio.dart' as dio_package;

import '../useraccount/view.dart';

class CallusScreen extends StatefulWidget {
  const CallusScreen({Key? key}) : super(key: key);

  @override
  State<CallusScreen> createState() => _CallusScreenState();
}

class _CallusScreenState extends State<CallusScreen> {
  final descriptionController = TextEditingController();
  bool loading = false;

  Future<void> sendAsk() async {
    try {
      setState(() {
        loading = true;
      });

      GetStorage getStorage = GetStorage();
      dio_package.Response response = await dio().post('send_ask',
          data: dio_package.FormData.fromMap({

            'email': getStorage.read('myUserData')['email'],
            'ask': descriptionController.text
          }));

      print(response.data);
      setState(() {
        loading = false;
      });

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => UseraccountScreen(),
        ),
      );
    } catch (e) {
      print(e.toString());
      setState(() {
        loading = false;
      });
    }
  }

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
              builder: (BuildContext context) => UseraccountScreen(),
            ),
          );},
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Have any inquiry or proplem? Contact Us, We Are\nHere To Help You",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0D3C3C)),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 183,
                width: 327,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFFFFFFF),
                    boxShadow: const [
                      BoxShadow(blurRadius: 3, offset: Offset(0.5, 0.5))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                  ),
                  child: TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Tybe Here..",
                        hintStyle:
                        TextStyle(fontSize: 14, color: Color(0xFFD9D9D9))),
                  ),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 49,
                  ),
                  Text(
                    "      Call This:",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff0D3C3C)),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "  015236676543",
                    style: TextStyle(fontSize: 14, color: Color(0xff0D3C3C)),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
              const SizedBox(
                height: 87,
                width: double.infinity,
              ), loading
                  ? const CircularProgressIndicator():
              ElevatedButton(
                onPressed:sendAsk ,
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(314, 44), backgroundColor: const Color(0xff0D3C3C),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: const Text("Send"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
