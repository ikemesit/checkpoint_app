import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput(
      {Key? key,
      required this.label,
      required this.hintText,
      required this.errorMsg,
      required this.onSaved,
      required this.controller})
      : super(key: key);

  final String label;
  final String hintText;
  final String errorMsg;
  final TextEditingController controller;
  final void Function(String?) onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
        filled: true,
        fillColor: Colors.black12,
        border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        hintText: hintText,
        errorStyle: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return errorMsg;
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}
