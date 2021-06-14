import 'package:flutter/material.dart';

import '../../constant.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.hint,
    required this.model
  }) : super(key: key);

  final String hint;
  final TextEditingController model;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        fontSize: 48
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(defaultPadding),
        labelText: hint,
        border: InputBorder.none,
        labelStyle: TextStyle(
          fontSize: 24
        )
      ),
      controller: model,
    );
  }
}