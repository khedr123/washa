import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String label;
  final double lengh;
  final double width;


  const Button({
    Key? key,

    required this.label,
    required this.lengh,
    required this.width,
  }) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {




  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ), backgroundColor: const Color(0xff0D3C3C),

          fixedSize: Size(widget.lengh, widget.width),
        ),

        onPressed: () {  },
        child: Text(widget.label,
            style: const TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: 16,
            )));
  }
}
