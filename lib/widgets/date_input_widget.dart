import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

import '../checkpoint_theme.dart';

class DateInputWidget extends StatelessWidget {
  final String label;
  final DateTime initialValue;
  final DateTime initialDate;
  final TextEditingController controller;
  final void Function(DateTime?)? onChanged;

  const DateInputWidget(
      {Key? key,
      required this.label,
      required this.initialValue,
      required this.initialDate,
      required this.controller,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: CheckpointTheme.lightTextTheme.headline5),
        const SizedBox(height: 10),
        FormBuilderDateTimePicker(
          controller: controller,
          name: label,
          onChanged: onChanged,
          inputType: InputType.date,
          decoration: const InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            filled: true,
            fillColor: Color(0xfff2f3f8), // Colors.black12,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
          ),
          format: DateFormat("yyyy-MM-dd"),
          initialDate: initialDate,
          initialValue: initialValue,
          valueTransformer: (DateTime? dateTime) {
            return Jiffy(dateTime).format("yyyy-MM-dd");
          },
        ),
      ],
    );
  }
}
