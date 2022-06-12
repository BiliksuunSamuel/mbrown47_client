import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/cupertino.dart';


class DropdownInput extends StatelessWidget {
  final String title;
  final String hint;
  final dynamic value;
  final Function(dynamic val) handleChange;
  final List<dynamic> data;
  const DropdownInput(
      {Key? key,
      required this.title,
      required this.data,
      required this.hint,
      required this.value,
      required this.handleChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropDownFormField(
      titleText: title,
      filled: true,
      value: value,
      contentPadding: const EdgeInsets.all(8),
      textField: "display",
      valueField: "value",
      dataSource: data,
      hintText: hint,
      onChanged: (text) {
        handleChange(text);
      },
    );
  }
}
