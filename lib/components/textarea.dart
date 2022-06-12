import 'package:flutter/material.dart';


class TextArea extends StatelessWidget {
  final String hint;
  final String label;
  final int numberOflines;
  final Function(String) handleChange;
  const TextArea(
      {Key? key,
      required this.hint,
      required this.handleChange,
      required this.label,
      required this.numberOflines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) {
        handleChange(text);
      },
      maxLines: numberOflines,
      style: const TextStyle(
        height: 1.5,
      ),
      decoration:  InputDecoration(
        contentPadding:const EdgeInsets.all(10),
        border:const OutlineInputBorder(),
        focusedBorder:const OutlineInputBorder(),
        enabledBorder:const OutlineInputBorder(),
        hintText: hint,
        labelText:label,
      ),
    );
  }
}
