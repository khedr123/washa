import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChoseImage extends StatefulWidget {
  const ChoseImage({Key? key}) : super(key: key);

  @override
  State<ChoseImage> createState() => _ChoseImageState();
}

class _ChoseImageState extends State<ChoseImage> {
  File? myImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Color(0xff0D3C3C)),
        onPressed: () {},
      ),
    ),
      body: Padding(
        padding: const EdgeInsets.only(left: 39),
        child: GestureDetector(
          onTap: () {
            ImagePicker.platform
                .getImage(source: ImageSource.gallery)
                .then((value) {
              if (value != null) {
                myImage = File(value.path);
                setState(() {});
              }
            });
          },
          child: Container(
              margin: const EdgeInsets.only(top: 50),
              height: 135,
              width: 273,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFFFFFFF),
                  boxShadow: const [BoxShadow(blurRadius: 1, offset: Offset(1, 1))]),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (myImage != null)
                    Image.file(
                      myImage!,
                      fit: BoxFit.contain,
                    ),
                  Icon(
                    Icons.camera,
                    color: myImage != null ? Colors.white : Colors.black,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
