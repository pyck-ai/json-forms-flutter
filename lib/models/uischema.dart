class UISchemaElement {
  String? type;
  String? scope;
  List<UISchemaElement>? elements;
  String? label;
  String? text;
  Map<String, dynamic>? options;

  UISchemaElement({
    this.type,
    this.scope,
    this.elements,
    this.label,
    this.text,
    this.options,
  });

  factory UISchemaElement.fromJson(Map<String, dynamic> json) {
    return UISchemaElement(
      type: json['type'],
      scope: json['scope'],
      elements: json['elements'] != null
          ? (json['elements'] as List)
              .map((e) => UISchemaElement.fromJson(e))
              .toList()
          : null,
      label: json['label'],
      text: json['text'],
      options: json['options'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'scope': scope,
      'elements': elements?.map((e) => e.toJson()).toList(),
      'label': label,
      'text': text,
      'options': options,
    };
  }
}

class ControlElement extends UISchemaElement {
  ControlElement({
    String? type,
    String? scope,
    List<UISchemaElement>? elements,
    String? label,
    String? text,
    Map<String, dynamic>? options,
  }) : super(
          type: type,
          scope: scope,
          elements: elements,
          label: label,
          text: text,
          options: options,
        );

  factory ControlElement.fromJson(Map<String, dynamic> json) {
    return ControlElement(
      type: json['type'],
      scope: json['scope'],
      elements: json['elements'] != null
          ? (json['elements'] as List)
              .map((e) => UISchemaElement.fromJson(e))
              .toList()
          : null,
      label: json['label'],
      text: json['text'],
      options: json['options'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return super.toJson();
  }
}

class Layout extends UISchemaElement {
  Layout({
    String? type,
    String? scope,
    List<UISchemaElement>? elements,
    String? label,
    String? text,
    Map<String, dynamic>? options,
  }) : super(
          type: type,
          scope: scope,
          elements: elements,
          label: label,
          text: text,
          options: options,
        );

  factory Layout.fromJson(Map<String, dynamic> json) {
    return Layout(
      type: json['type'],
      scope: json['scope'],
      elements: json['elements'] != null
          ? (json['elements'] as List)
              .map((e) => UISchemaElement.fromJson(e))
              .toList()
          : null,
      label: json['label'],
      text: json['text'],
      options: json['options'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return super.toJson();
  }
}

class LabelElement extends UISchemaElement {
  LabelElement({
    String? type,
    String? scope,
    List<UISchemaElement>? elements,
    String? label,
    String? text,
    Map<String, dynamic>? options,
  }) : super(
          type: type,
          scope: scope,
          elements: elements,
          label: label,
          text: text,
          options: options,
        );

  factory LabelElement.fromJson(Map<String, dynamic> json) {
    return LabelElement(
      type: json['type'],
      scope: json['scope'],
      elements: json['elements'] != null
          ? (json['elements'] as List)
              .map((e) => UISchemaElement.fromJson(e))
              .toList()
          : null,
      label: json['label'],
      text: json['text'],
      options: json['options'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return super.toJson();
  }
}