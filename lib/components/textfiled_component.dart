import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key, required this.label, required this.prefixIcon,required this.readOnly})
      : super(key: key);
  final String label;
  final Icon prefixIcon;
  final bool readOnly;
  

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) {},
      obscureText: true,
      readOnly: readOnly,
      style: TextStyle(color: Theme.of(context).primaryColor),
      decoration: InputDecoration(
        label: Text(label, style: Theme.of(context).textTheme.bodyText1),
        prefixIcon: prefixIcon,
      ),
    );
  }
}
