import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../customcard/view.dart';
import '../vendorinformation/view.dart';

class UploadSceen extends StatefulWidget {
  const UploadSceen({Key? key}) : super(key: key);

  @override
  State<UploadSceen> createState() => _UploadSceenState();
}

class _UploadSceenState extends State<UploadSceen> {
  List<XFile> images = [];

  Future<void> getLostData() async {
    final ImagePicker picker = ImagePicker();
    images = await picker.pickMultiImage();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const ProfileScreen(),
                ),
              );}, icon: const Icon(Icons.add), color: const Color(0xff0D3C3C))
        ],
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xff0D3C3C),
            ),
            onPressed: () {}),
        title: const Text(
          "Profile",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff0D3C3C)),
        ),
      ),
      body: images.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Customcaaard(
                  name: "Upload Image",
                  onTap: getLostData,
                  width: 0.4,
                  hight: 0.15,
                ),
              ))
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 10),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      SizedBox(
                        height: 150,
                        width: 151,
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              File(images[index].path),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              images.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 22,
                          ))
                    ],
                  );
                },
              ),
            ),
    );
  }
}
