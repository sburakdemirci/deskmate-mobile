import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final Function(String) validator;

  const PasswordInput(
      {super.key,
      this.hintText,
      required this.controller,
      required this.validator});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hidePassword,
      controller: widget.controller,
      validator: (value) => widget.validator(value!),
      decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: const Icon(Icons.key),
          suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              child: hidePassword
                  ? const Icon(Icons.remove_red_eye_outlined)
                  : const Icon(Icons.visibility_off_outlined))),
    );
  }
}
