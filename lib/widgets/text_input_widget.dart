import 'package:flutter/material.dart';

import '../checkpoint_theme.dart';

class TextInputWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final String? Function(String?)? validatorFn;
  final void Function(String?)? onChanged;
  final TextEditingController controller;
  final bool? obscureText;

  const TextInputWidget({
    Key? key,
    required this.label,
    required this.hintText,
    required this.validatorFn,
    required this.onChanged,
    required this.controller,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: CheckpointTheme.lightTextTheme.headline5),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            filled: true,
            fillColor: const Color(0xfff2f3f8), // Colors.black12,
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            hintText: hintText,
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            errorStyle: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          validator: validatorFn,
          onSaved: onChanged,
        ),
      ],
    );
  }
}
