import 'package:flutter/material.dart';

import '../utils.dart';

class CheckboxControl extends StatefulWidget {
  const CheckboxControl({
    super.key,
    required this.label,
    required this.path,
    required this.jsonData,
    required this.callback,
  });

  final String label;
  final List<String> path;
  final Map<String, dynamic> jsonData;
  final JsonFormsCallback callback;

  @override
  State<CheckboxControl> createState() => _CheckboxState();
}

class _CheckboxState extends State<CheckboxControl> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    bool value = getValueFromPath(widget.jsonData, widget.path) ?? false;

    return CheckboxListTile(
      value: value,
      onChanged: (bool? value) {
        setState(() {
          setValueAtPath(widget.jsonData, widget.path, value);
        });
        widget.callback(widget.jsonData);
      },
      title: Text(widget.label),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
