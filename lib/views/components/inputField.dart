import 'package:flutter/material.dart';
import 'package:the_crew_companion/utils/constant.dart';

class InputField extends StatelessWidget {
  const InputField({required this.hint, required this.model});

  final String hint;
  final TextEditingController model;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(defaultPadding),
        labelText: hint,
        border: InputBorder.none,
      ),
      controller: model,
    );
  }
}
