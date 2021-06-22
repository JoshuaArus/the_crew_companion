import 'package:flutter/material.dart';

import '../../constant.dart';

class InputField extends StatelessWidget {
  const InputField({Key? key, required this.hint, required this.model})
      : super(key: key);

  final String hint;
  final TextEditingController model;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(defaultPadding),
        labelText: hint,
        border: InputBorder.none,
      ),
      controller: model,
    );
  }
}
