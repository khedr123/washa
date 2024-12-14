import 'package:flutter/material.dart';

class Customcaaard extends StatelessWidget {
  final String name;

  final void Function()? onTap;

  final double width;
  final double hight;

  const Customcaaard(
      {Key? key,
      required this.name,
      this.onTap,
      required this.width,
      required this.hight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * width,
      height: MediaQuery.of(context).size.height * hight,
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.white)),
          elevation: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.0),
                child: Text(
                  name,
                  style: const TextStyle(
                      color: Color(0xff0D3C3C),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
