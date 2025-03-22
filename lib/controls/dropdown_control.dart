import 'package:flutter/material.dart';

import '../utils.dart';

class DropdownControl extends StatefulWidget {
  const DropdownControl({
    super.key,
    required this.label,
    required this.description,
    required this.path,
    required this.jsonData,
    required this.callback,
    required this.enumValues,
  });

  final String label;
  final String? description;
  final List<String> path;
  final Map<String, dynamic> jsonData;
  final JsonFormsCallback callback;
  final List<dynamic> enumValues;

  @override
  State<DropdownControl> createState() => _DropdownControlState();
}

class _DropdownControlState extends State<DropdownControl> {
  List<DropdownMenuEntry<String>> getDropdownMenuEntries(List<String> values) {
    return values.map((String value) {
      return DropdownMenuEntry(value: value, label: value);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: DropdownMenu<String>(
        expandedInsets: EdgeInsets.zero,
        requestFocusOnTap: true,
        label: Text(widget.label),
        onSelected: (String? value) {
          setValueAtPath(widget.jsonData, widget.path, value);
          widget.callback(widget.jsonData);
        },
        dropdownMenuEntries: getDropdownMenuEntries(
          widget.enumValues as List<String>,
        ),
      ),
    );
  }
}
