import 'package:flutter/material.dart';

import '../utils.dart';

class NumberControl extends StatefulWidget {
  const NumberControl({
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
  State<NumberControl> createState() => _NumberControlState();
}

class _NumberControlState extends State<NumberControl> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    controller.text = getValueFromPath(widget.jsonData, widget.path) ?? "";
    controller.addListener(() {
      setValueAtPath(
        widget.jsonData,
        widget.path,
        double.tryParse(controller.text),
      );

      widget.callback(widget.jsonData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextFormField(
        controller: controller,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: widget.label,
          helperText: widget.description,
        ),
      ),
    );
  }
}
