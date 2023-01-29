import 'package:flutter/material.dart';

class TextInputIconLeft extends StatelessWidget {
  final IconData buttonIcon;
  final Function(String) onTextChanged;
  final String? hint;

  const TextInputIconLeft(
      {Key? key,
      required this.buttonIcon,
      required this.onTextChanged,
      this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(
          buttonIcon,
        ),
      ),
      onChanged: (value) => onTextChanged(value),
    );
  }
}
