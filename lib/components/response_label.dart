import 'package:flutter/material.dart';

class ResponseLabel extends StatelessWidget {
  final String text;
  final bool isError;
  const ResponseLabel({Key? key,required this.text,required this.isError}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text,
                style: TextStyle(color:isError? Colors.red:Colors.green, fontSize: 16,fontWeight: FontWeight.bold))
    );
  }
}
