import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.title,required this.elevated, required this.handlePressed,})
      : super(key: key);
  final String title;
  final bool elevated;
  final VoidCallback handlePressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        elevated
            ? Expanded(
                
                child: ElevatedButton(onPressed: handlePressed, child: Text(title)))
            : Expanded(
                child: OutlinedButton(onPressed: handlePressed, child: Text(title))),
      ],
    );
  }
}
