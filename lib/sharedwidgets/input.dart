import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isLastInput, isPassword;
  final validator;
  final myicon;
  final Widget? suffixIcon;
  

  const Input(
      {Key? key,
      required this.label,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.isLastInput = false,
      this.isPassword = false,
      this.suffixIcon,
      this.validator, this.myicon})
      : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 314,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xffEDEDED),
      ),
      child: TextFormField(
        cursorColor: const Color(0xff0D3C3C),
        validator: widget.validator,

        obscureText:widget.isPassword,
        keyboardType: widget.keyboardType,
        textInputAction:
            widget.isLastInput ? TextInputAction.done : TextInputAction.next,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
          prefixIcon: widget.myicon,
          prefixStyle: const TextStyle(color: Color(0xff0D3C3C)),
          suffixIcon: widget.suffixIcon,
          hintText: widget.label,
          border: InputBorder.none,

          contentPadding: const EdgeInsets.only(left: 20,top: 10),
        ),
        controller: widget.controller,
      ),
    );
  }
}
