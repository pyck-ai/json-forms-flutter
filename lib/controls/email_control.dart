import 'package:flutter/material.dart';

import '../utils.dart';

class EmailControl extends StatefulWidget {
  const EmailControl({
    super.key,
    required this.label,
    required this.description,
    required this.path,
    required this.jsonData,
    required this.callback, this.multi,
  });

  final String label;
  final String? description;
  final List<String> path;
  final Map<String, dynamic> jsonData;
  final JsonFormsCallback callback;
  final bool? multi;

  @override
  State<EmailControl> createState() => _EmailControlState();
}

class _EmailControlState extends State<EmailControl> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    controller.text = getValueFromPath(widget.jsonData, widget.path) ?? "";
    controller.addListener(() {
      setValueAtPath(
        widget.jsonData,
        widget.path,
        controller.text,
      );

      widget.callback(widget.jsonData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextFormField(
        controller: controller,
        maxLines: widget.multi == true ? 5 : 1,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null) {
            return null;
          }

          return RegExp(RegexPattern.email).hasMatch(value) ? null : "Invalid";
        },
        decoration: InputDecoration(
          labelText: widget.label,
          helperText: widget.description,
        ),
      ),
    );
  }
}
