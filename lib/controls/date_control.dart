import 'package:flutter/material.dart';

import '../utils.dart';

class DateControl extends StatefulWidget {
  const DateControl({
    super.key,
    required this.label,
    required this.description,
    required this.path,
    required this.jsonData,
    required this.callback,
  });

  final String label;
  final String? description;
  final List<String> path;
  final Map<String, dynamic> jsonData;
  final JsonFormsCallback callback;

  @override
  State<DateControl> createState() => _DateControlState();
}

class _DateControlState extends State<DateControl> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        onPressed: () async {
          final DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          );

          if (pickedDate != null) {
            setValueAtPath(
              widget.jsonData,
              widget.path,
              pickedDate,
            );
          }
        },
        child: Text(widget.label),
      ),
    );
  }
}
