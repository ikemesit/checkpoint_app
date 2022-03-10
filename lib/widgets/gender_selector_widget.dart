import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../checkpoint_theme.dart';

class GenderSelectorWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validationFn;

  GenderSelectorWidget({
    Key? key,
    required this.controller,
    required this.validationFn,
  }) : super(key: key);

  final _genderOptions = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Gender', style: CheckpointTheme.lightTextTheme.headline5),
        const SizedBox(height: 10),
        FormBuilderDropdown(
          name: 'gender',
          decoration: const InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            filled: true,
            fillColor: Color(0xfff2f3f8), // Colors.black12,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            errorStyle: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          initialValue: 'Male',
          allowClear: true,
          hint: const Text('Select Gender'),
          validator: validationFn,
          items: _genderOptions
              .map((gender) => DropdownMenuItem(
                    value: gender,
                    child: Text(gender),
                  ))
              .toList(),
          onChanged: (String? value) {
            if (value != null && value.isNotEmpty) {
              controller.text = value.toLowerCase() == 'male' ? 'm' : 'f';
            }
          },
        ),
      ],
    );
  }
}
