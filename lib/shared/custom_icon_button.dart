import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback handlePress;
   Color? iconColor = Colors.black;
  final IconData buttonIcon;
   CustomIconButton(
      {Key? key, required this.handlePress, required this.buttonIcon,this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: IconButton(
        onPressed: handlePress,
        icon: Icon(
          buttonIcon,
          size: 18,
          color: iconColor,
        ),
      ),
    );
  }
}
