import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TagLabelDisplay extends StatelessWidget {
  final String label;
  final String value;
  const TagLabelDisplay({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16,color: Colors.black),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.black),
        ),
        
      ],
    );
  }
}
