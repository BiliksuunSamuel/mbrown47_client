import 'package:flutter/material.dart';

class ListTitleLabel extends StatelessWidget {
  final String text;
   String? trailText = "See All";
   ListTitleLabel({Key? key, required this.text,this.trailText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
      ),
      trailing: TextButton(
        onPressed: () {},
        child:trailText != null?Text(trailText.toString()) :const Text("See All"),
      ),
    );
  }
}
