import 'package:flutter/material.dart';

import '../utils.dart';
import 'controls/checkbox_control.dart';
import 'controls/date_control.dart';
import 'controls/dropdown_control.dart';
import 'controls/email_control.dart';
import 'controls/integer_control.dart';
import 'controls/number_control.dart';
import 'controls/text_control.dart';
import 'controls/uri_control.dart';
import 'models/jsonSchema4.dart';
import 'models/uischema.dart';

enum ElementType { VerticalLayout, HorizontalLayout, Control, Label, Group }

enum PropertyType { string, number, integer, boolean, array, object }

enum PropertyFormat { date, time, email, hostname, uri }

class JsonForms {
  late UISchemaElement uiSchema;
  late JsonSchema4 dataSchema;
  late Map<String, dynamic> data;
  final JsonFormsCallback callback;

  JsonForms(
    Map<String, dynamic> dataSchemaJson,
    Map<String, dynamic> uiSchemaJson,
    Map<String, dynamic> dataJson,
    this.callback,
  ) {
    dataSchema = JsonSchema4.fromJson(dataSchemaJson);
    uiSchema = UISchemaElement.fromJson(uiSchemaJson);
    data = dataJson;
  }

  JsonSchema4 getItem(List<String> parts, JsonSchema4 schema) {
    JsonSchema4? item = schema.properties?[parts[1]];
    if (item == null) return JsonSchema4();
    if (item.type == PropertyType.object.name && parts.length > 2) {
      parts.removeRange(0, 2);
      return getItem(parts, item);
    }
    return item;
  }

  Widget getControl(
    UISchemaElement uiSchema,
    JsonSchema4 schema,
    BuildContext context,
  ) {
    List<String> parts = uiSchema.scope!.split("/");
    parts.removeAt(0);
    String label = uiSchema.label ?? camelCaseToWords(parts.last);

    if (schema.required != null && schema.required!.contains(parts.last)) {
      label += "*";
    }

    JsonSchema4 item = getItem(parts, schema);

    if (item.type == PropertyType.string.name) {
      bool? multi = uiSchema.options?["multi"];

      if (item.format == PropertyFormat.date.name) {
        return DateControl(
          label: label,
          description: item.description,
          path: getParts(uiSchema.scope!),
          jsonData: data,
          callback: (Map<String, dynamic> data) {
            callback(data);
          },
        );
      }

      if (item.format == PropertyFormat.email.name) {
        return EmailControl(
          label: label,
          description: item.description,
          path: getParts(uiSchema.scope!),
          jsonData: data,
          callback: (Map<String, dynamic> data) {
            callback(data);
          },
          multi: multi,
        );
      }

      if (item.format == PropertyFormat.uri.name) {
        return UriControl(
          label: label,
          description: item.description,
          path: getParts(uiSchema.scope!),
          jsonData: data,
          callback: (Map<String, dynamic> data) {
            callback(data);
          },
          multi: multi,
        );
      }

      if (item.enumValues != null) {
        return DropdownControl(
          label: label,
          description: item.description,
          path: getParts(uiSchema.scope!),
          jsonData: data,
          callback: (Map<String, dynamic> data) {
            callback(data);
          },
          enumValues: item.enumValues as List<String>,
        );
      }

      return TextControl(
        label: label,
        description: item.description,
        path: getParts(uiSchema.scope!),
        jsonData: data,
        callback: (Map<String, dynamic> data) {
          callback(data);
        },
        minLength: item.minLength,
        multi: multi,
      );
    } else if (item.type == PropertyType.boolean.name) {
      return CheckboxControl(
        label: label,
        path: getParts(uiSchema.scope!),
        jsonData: data,
        callback: (Map<String, dynamic> data) {
          callback(data);
        },
      );
    } else if (item.type == PropertyType.integer.name) {
      return IntegerControl(
        label: label,
        description: item.description,
        path: getParts(uiSchema.scope!),
        jsonData: data,
        callback: (Map<String, dynamic> data) {
          callback(data);
        },
      );
    } else if (item.type == PropertyType.number.name) {
      return NumberControl(
        label: label,
        description: item.description,
        path: getParts(uiSchema.scope!),
        jsonData: data,
        callback: (Map<String, dynamic> data) {
          callback(data);
        },
      );
    }

    return Container();
  }

  List<Widget> createWidgets(
    UISchemaElement schema,
    BuildContext context,
    List<Widget> widgets,
  ) {
    if (schema.type == ElementType.Label.name) {
      widgets.add(
        ListTile(
          title: Text(
            schema.text!,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      );
    } else if (schema.type == ElementType.Control.name) {
      widgets.add(getControl(schema, dataSchema, context));
    } else if (schema.type == ElementType.VerticalLayout.name ||
        schema.type == ElementType.HorizontalLayout.name ||
        schema.type == ElementType.Group.name) {
      if (schema.label != null) {
        widgets.add(
          ListTile(
            title: Text(
              schema.label!,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            visualDensity: VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
          ),
        );
      }

      for (var element in schema.elements!) {
        List<Widget> current = createWidgets(element, context, []);
        widgets.addAll(current);
      }
    } else {
      widgets.add(Text("Unknown uiSchema type"));
    }

    return widgets;
  }

  final _formKey = GlobalKey<FormState>();

  Widget getWidget(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(children: createWidgets(uiSchema, context, [])),
    );
  }
}
