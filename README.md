<?code-excerpt path-base="example"?>

# json_forms

[![pub package](https://img.shields.io/pub/v/json_forms.svg)](https://pub.dev/packages/json_forms)

A Flutter package to render forms from JSON Schema based on https://jsonforms.io

## Features Supported

See the example app for detailed implementation information.

| **Control**                      | **Type**        | **Supported** |
|----------------------------------|---------------|---------------|
| **Text**                         | string        | ✅             |
| **Textarea**                     | string        | ✅             |
| **RichText**                     | string        | ❌             |
| **Email**                        | string        | ❌             |
| **Select (Enum, single select)** | string        | ✅             |
| **Select (Enum, multi select)**  | string        | ❌             |
| **Number**                       | number        | ✅             |
| **Slider**                       | number        | ❌             |
| **Integer**                      | integer       | ✅             |
| **Checkbox**                     | boolean       | ✅             |
| **Toggle**                       | boolean       | ❌             |
| **Date**                         | string        | ✅             |
| **Time**                         | string        | ❌             |
| **Date&Time**                    | string        | ❌             |
| **DateRange**                    | range(date)   | ❌             |
| **SliderRange**                  | range(number) | ❌             |
| **Files**                        | file          | ❌             |

## Example

<?code-excerpt "lib/basic.dart (basic-example)"?>

```dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_forms/json_forms.dart';

class JsonFormPage extends StatefulWidget {
  const JsonFormPage({super.key});

  @override
  State<JsonFormPage> createState() => _JsonFormPageState();
}

class _JsonFormPageState extends State<JsonFormPage> {
  JsonForms? jsonForms;

  Map<String, dynamic> data = {};

  jsonFormUpdate(Map<String, dynamic> newData) {
    print(newData);
  }

  Future<void> getFormSchema() async {
    http.Response example1DataSchema = await http.get(
      Uri.parse(
        'https://raw.githubusercontent.com/pyck-ai/json-forms-examples/refs/heads/main/example1/dataSchema.json',
      ),
    );
    http.Response example1UiSchema = await http.get(
      Uri.parse(
        'https://raw.githubusercontent.com/pyck-ai/json-forms-examples/refs/heads/main/example1/uiSchema.json',
      ),
    );

    setState(() {
      jsonForms = JsonForms(
        json.decode(example1DataSchema.body),
        json.decode(example1UiSchema.body),
        data,
        jsonFormUpdate,
      );
    });
  }

  @override
  void initState() {
    super.initState();

    getFormSchema();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("example1"),
      ),
      body:
      jsonForms != null
          ? jsonForms!.getWidget(context)
          : Center(child: CircularProgressIndicator()),
    );
  }
}

```

This example renders the following form based on the schema hosted here: https://github.com/pyck-ai/json-forms-examples/tree/main/example1

You can check out the example repository for more examples.

<img src="example.png" width="320" alt="Form Example">

