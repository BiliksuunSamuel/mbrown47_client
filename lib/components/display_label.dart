
import 'package:flutter/material.dart';


class DisplayLabel extends StatelessWidget {
  final String label;
  final dynamic value;
  const DisplayLabel({Key? key,required this.label,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      
      alignment: Alignment.centerLeft,
      padding:const EdgeInsets.all(5),
      child:Column(
      children: [
      const Divider(),
      Row(
        children: [
          Expanded(child: 
          Text(label.toString(),
          textAlign: TextAlign.left,
          maxLines: 1,
          overflow:TextOverflow.ellipsis,
          style:const  TextStyle(fontSize: 16,
          fontWeight:FontWeight.normal),),)
        ],
      ),
      //value widget
      Row(
        children: [
          Expanded(child: 
          Text(value.toString(),
          maxLines: 1,
          textAlign: TextAlign.left,
          style:const TextStyle(fontWeight:FontWeight.bold,fontSize: 16)),
          )
        ],
      )
      
      ],
    )
    );
  }
}
