
import 'package:allwellbuy/styles/style.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key? key,
    required this.hint,
    required this.controller,
    this.inputType,
    this.inputAction,
  }) : super(key: key);

  final String hint;
  final TextEditingController controller;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        height: size.height * 0.07,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
              ),
              hintText: hint,
              hintStyle: style14to,
            ),
            keyboardType: inputType,
            textInputAction: inputAction,
            controller: controller,
          ),
        ),
      ),
    );
  }
}
