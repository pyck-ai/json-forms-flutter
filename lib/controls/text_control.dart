import 'package:flutter/material.dart';

import '../utils.dart';

class TextControl extends StatefulWidget {
  const TextControl({
    super.key,
    required this.label,
    required this.description,
    required this.path,
    required this.jsonData,
    required this.callback,
    this.minLength, this.multi,
  });

  final String label;
  final String? description;
  final List<String> path;
  final Map<String, dynamic> jsonData;
  final JsonFormsCallback callback;
  final int? minLength;
  final bool? multi;

  @override
  State<TextControl> createState() => _TextControlState();
}

class _TextControlState extends State<TextControl> {
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

          if (widget.minLength != null) {
            return value.length > widget.minLength! ? null : "Invalid";
          }

          return null;
        },
        decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: widget.label,
          helperText: widget.description,
        ),
      ),
    );
  }
}
