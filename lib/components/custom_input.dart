import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String hint;
  final String label;
  final Function(String) handleChanged;

  //
  const CustomInput(
      {Key? key,
      required this.hint,
      required this.label,
      required this.handleChanged})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: false,
        onChanged: (text) => handleChanged(text),
        style: const TextStyle(
          height: 1.5,
        ),
        decoration: InputDecoration(
            contentPadding:const EdgeInsets.all(10),
            border:const OutlineInputBorder(),
            focusedBorder:const OutlineInputBorder(),
            enabledBorder:const OutlineInputBorder(),
            hintText: hint,
            labelText: label));
  }
}
