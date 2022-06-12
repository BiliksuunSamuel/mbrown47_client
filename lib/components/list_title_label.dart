import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListTitleLabel extends StatelessWidget {
  final String text;
  const ListTitleLabel({Key? key, required this.text}) : super(key: key);

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
        child: const Text("See All"),
      ),
    );
  }
}
