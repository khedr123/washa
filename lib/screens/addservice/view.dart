import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart' as dio_package;
import 'package:image_picker/image_picker.dart';

import '../../sharedwidgets/dio_helpers.dart';
import '../vendorhome/view.dart';

class AddserviceScreen extends StatefulWidget {
  const AddserviceScreen({Key? key}) : super(key: key);

  @override
  State<AddserviceScreen> createState() => _AddserviceScreenState();
}

class _AddserviceScreenState extends State<AddserviceScreen> {
  final descriptionController = TextEditingController();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  File? image;
  bool loading = false;

  Future<void> addService() async {
    var imageServer ;

    if (image != null) {
      imageServer = dio_package.MultipartFile.fromFileSync(image!.path,
          filename: image!.path.split('/').last);
    }
    try {
      setState(() {
        loading = true;
      });

      GetStorage getStorage = GetStorage();
      dio_package.Response response = await dio().post('add_service',
          data: dio_package.FormData.fromMap({
            'name': nameController.text,
            'image': imageServer,

            'price': priceController.text,
            'description':descriptionController.text ,
            'user_id': getStorage.read('myUserData')['id']
          }));
      getStorage.write('myUserData', response.data);
      print(response.data);
      setState(() {
        loading = false;
      });

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => const VendorHomeScreen(),
        ),
      );
    } catch (e) {
      print(e.toString());
      setState(() {
        loading = false;
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
            onPressed: () {}),
        title: const Text(
          "Add Service",
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
                height: 63,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 39),
                child: GestureDetector(
                  onTap: () {
                    ImagePicker.platform
                        .getImage(source: ImageSource.gallery)
                        .then((value) {
                      if (value != null) {
                        image = File(value.path);
                        setState(() {});
                      }
                    });
                  },
                  child: Container(
                      margin: const EdgeInsets.only(top: 50),
                      height: 135,
                      width: 273,

                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFFFFFFFF),
                          boxShadow: const [
                            BoxShadow(blurRadius: 1, offset: Offset(1, 1))
                          ]),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          if (image != null)
                            Image.file(
                              image!,
                              fit: BoxFit.contain,
                            ),
                          Icon(
                            Icons.camera,
                            color:
                                image != null ? Colors.white : Colors.black,
                          )
                        ],
                      )),
                ),
              ),
              const SizedBox(
                height: 87,
              ),
              Container(
                height: 44,
                width: 314,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey[200]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27),
                  child: TextField(
                    decoration: const InputDecoration(
                        icon: Icon(
                          Icons.account_circle_outlined,
                          color: Color(0xff0D3C3C),
                        ),
                        border: InputBorder.none,
                        hintText: "Name",
                        hintStyle:
                            TextStyle(fontSize: 12, color: Color(0xff0D3C3C))),
                    controller: nameController,
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 44,
                  width: 314,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[200]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 27),
                    child: TextField(
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.price_change_outlined,
                            color: Color(0xff0D3C3C),
                          ),
                          border: InputBorder.none,
                          hintText: "Price",
                          hintStyle: TextStyle(
                              fontSize: 12, color: Color(0xff0D3C3C))),
                      controller: priceController,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 21,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 145,
                  width: 316,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[200]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 27),
                    child: TextField(
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.description_outlined,
                            color: Color(0xff0D3C3C),
                          ),
                          border: InputBorder.none,
                          hintText: "Descrepition",
                          hintStyle: TextStyle(
                              fontSize: 12, color: Color(0xff0D3C3C))),
                      controller: descriptionController,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 64,
              ),
              loading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: addService,
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(137, 39), backgroundColor: const Color(0xff0D3C3C),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: const Text("Add"),
                    ),
              const SizedBox(
                height: 77,
              )
            ],
          ),
        ),
      ),
    );
  }
}
