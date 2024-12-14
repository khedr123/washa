import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String name;

  final String image;

  final void Function()? onTap;

  const CustomCard(
      {Key? key, required this.name, required this.image, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white)),
        elevation: 20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 64,
              height: 64,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03),
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
    );
  }
}
