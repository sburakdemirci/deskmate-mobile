import 'package:flutter/material.dart';

class TextInputIconLeft extends StatelessWidget {
  final IconData buttonIcon;
  final String? hintText;
  final TextEditingController controller;
  final Function(String) validator;

  const TextInputIconLeft(
      {Key? key,
      required this.buttonIcon,
      this.hintText,
      required this.controller,
      required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => validator(value!),
      autocorrect: false,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(buttonIcon),
      ),
    );
  }
}
