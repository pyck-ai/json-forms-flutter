import 'package:flutter/material.dart';

import '../utils.dart';

class UriControl extends StatefulWidget {
  const UriControl({
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
  State<UriControl> createState() => _UriControlState();
}

class _UriControlState extends State<UriControl> {
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
        validator: (value) {
          if (value == null) {
            return null;
          }

          return RegExp(RegexPattern.uri).hasMatch(value) ? null : "Invalid";
        },
        decoration: InputDecoration(
          labelText: widget.label,
          helperText: widget.description,
        ),
      ),
    );
  }
}
