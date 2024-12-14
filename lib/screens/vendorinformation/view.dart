import 'dart:io';

import 'package:carservice/models/all_data_profile.dart';
import 'package:carservice/screens/vendorhome/view.dart';
import 'package:carservice/sharedwidgets/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart' as dio_package;
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AllProfileData? allProfileData ;
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final locationController = TextEditingController();
  File? image;
  bool loading = false;

  Future<void> addImage() async {
    var imageServer;

    if (image != null) {
      imageServer = dio_package.MultipartFile.fromFileSync(image!.path,
          filename: image!.path.split('/').last);
    }
    try {
      setState(() {
        loading = true;
      });
      GetStorage getStorage = GetStorage();
      var response = await DioHelper.postData( url: 'profile_image/${getStorage.read('userId')}', data: {
        'image':imageServer,
        '_method': 'put'
      });
      // dio_package.Response response = await dio().post('',
      //     data: dio_package.FormData.fromMap(
      //         {'image': imageServer, '_method': 'put'}));
      setState(() {
        loading = false;
      });

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => const VendorHomeScreen(),
        ),
      );
      getStorage.write('myUserData', response.data);
      print(response.data);
    } catch (e) {
      print(e.toString());
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    addImage().then((value) {
      emailController.text=allProfileData!.email!;
    });


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: (AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff0D3C3C),
          ),
          onPressed: () {},
        ),
        title: const Text(
          'Information',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff0D3C3C)),
        ),
      )),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 21,
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
                      height: 100,
                      width: 100,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
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
                            color: image != null ? Colors.white : Colors.black,
                          )
                        ],
                      )),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              Container(
                height: 44,
                width: 314,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey[200]),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 33),
                  child: TextField(
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.account_circle_outlined,
                            color: Color(0xff0D3C3C),
                          ),
                          border: InputBorder.none,
                          hintText: "Name",
                          hintStyle: TextStyle(
                              fontSize: 12, color: Color(0xff0D3C3C)))),
                ),
              ),
              const SizedBox(
                height: 21,
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
                    padding: const EdgeInsets.symmetric(horizontal: 34),
                    child: TextField(
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.email_outlined,
                            color: Color(0xff0D3C3C),
                          ),
                          border: InputBorder.none,
                          hintText: "Email",
                          hintStyle: TextStyle(
                              fontSize: 12, color: Color(0xff0D3C3C))),
                      controller: emailController,
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
                  height: 44,
                  width: 314,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[200]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: TextField(
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.visibility_off_rounded,
                            color: Color(0xff0D3C3C),
                          ),
                          border: InputBorder.none,
                          hintText: "Password",
                          hintStyle: TextStyle(
                              fontSize: 12, color: Color(0xff0D3C3C))),
                      controller: passwordController,
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
                  height: 44,
                  width: 314,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[200]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: TextField(
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.visibility_off_rounded,
                            color: Color(0xff0D3C3C),
                          ),
                          border: InputBorder.none,
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(
                              fontSize: 12, color: Color(0xff0D3C3C))),
                      controller: confirmPasswordController,
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
                  height: 44,
                  width: 314,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[200]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 31),
                    child: TextField(
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.my_location_outlined,
                            color: Color(0xff0D3C3C),
                          ),
                          border: InputBorder.none,
                          hintText: "Choose Location",
                          hintStyle: TextStyle(
                              fontSize: 12, color: Color(0xff0D3C3C))),
                      controller: locationController,
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
                onPressed: addImage,
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(160, 39), backgroundColor: const Color(0xff0D3C3C),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: const Text("Save"),
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
