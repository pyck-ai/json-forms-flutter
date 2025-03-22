class JsonSchema4 {
  String? id;
  String? $schema;
  String? title;
  String? description;
  String? type;
  List<String>? required;
  Map<String, JsonSchema4>? properties;
  JsonSchema4? items;
  List<JsonSchema4>? allOf;
  List<JsonSchema4>? anyOf;
  List<JsonSchema4>? oneOf;
  JsonSchema4? not;
  dynamic defaultValue;
  List<dynamic>? enumValues;
  String? format;
  bool? readOnly;
  bool? writeOnly;
  bool? deprecated;
  num? multipleOf;
  num? maximum;
  bool? exclusiveMaximum;
  num? minimum;
  bool? exclusiveMinimum;
  int? maxLength;
  int? minLength;
  String? pattern;
  int? maxItems;
  int? minItems;
  bool? uniqueItems;
  int? maxProperties;
  int? minProperties;
  Map<String, JsonSchema4>? definitions;
  Map<String, JsonSchema4>? patternProperties;
  Map<String, JsonSchema4>? dependencies;
  JsonSchema4? additionalProperties;
  JsonSchema4? additionalItems;
  JsonSchema4? propertyNames;
  JsonSchema4? contains;
  JsonSchema4? constValue;
  List<JsonSchema4>? examples;
  Map<String, dynamic>? extensions;

  JsonSchema4({
    this.id,
    this.$schema,
    this.title,
    this.description,
    this.type,
    this.required,
    this.properties,
    this.items,
    this.allOf,
    this.anyOf,
    this.oneOf,
    this.not,
    this.defaultValue,
    this.enumValues,
    this.format,
    this.readOnly,
    this.writeOnly,
    this.deprecated,
    this.multipleOf,
    this.maximum,
    this.exclusiveMaximum,
    this.minimum,
    this.exclusiveMinimum,
    this.maxLength,
    this.minLength,
    this.pattern,
    this.maxItems,
    this.minItems,
    this.uniqueItems,
    this.maxProperties,
    this.minProperties,
    this.definitions,
    this.patternProperties,
    this.dependencies,
    this.additionalProperties,
    this.additionalItems,
    this.propertyNames,
    this.contains,
    this.constValue,
    this.examples,
    this.extensions,
  });

  factory JsonSchema4.fromJson(Map<String, dynamic> json) {
    return JsonSchema4(
      id: json['id'],
      $schema: json[r'$schema'],
      title: json['title'],
      description: json['description'],
      type: json['type'],
      required:
          json['required'] != null ? List<String>.from(json['required']) : null,
      properties:
          json['properties'] != null
              ? (json['properties'] as Map<String, dynamic>).map(
                (k, v) => MapEntry(k, JsonSchema4.fromJson(v)),
              )
              : null,
      items: json['items'] != null ? JsonSchema4.fromJson(json['items']) : null,
      allOf:
          json['allOf'] != null
              ? (json['allOf'] as List)
                  .map((e) => JsonSchema4.fromJson(e))
                  .toList()
              : null,
      anyOf:
          json['anyOf'] != null
              ? (json['anyOf'] as List)
                  .map((e) => JsonSchema4.fromJson(e))
                  .toList()
              : null,
      oneOf:
          json['oneOf'] != null
              ? (json['oneOf'] as List)
                  .map((e) => JsonSchema4.fromJson(e))
                  .toList()
              : null,
      not: json['not'] != null ? JsonSchema4.fromJson(json['not']) : null,
      defaultValue: json['default'],
      enumValues:
          json['enum'] != null
              ? json["type"] == "string"
                  ? List<String>.from(json['enum'])
                  : List<dynamic>.from(json['enum'])
              : null,
      format: json['format'],
      readOnly: json['readOnly'],
      writeOnly: json['writeOnly'],
      deprecated: json['deprecated'],
      multipleOf: json['multipleOf'],
      maximum: json['maximum'],
      exclusiveMaximum: json['exclusiveMaximum'],
      minimum: json['minimum'],
      exclusiveMinimum: json['exclusiveMinimum'],
      maxLength: json['maxLength'],
      minLength: json['minLength'],
      pattern: json['pattern'],
      maxItems: json['maxItems'],
      minItems: json['minItems'],
      uniqueItems: json['uniqueItems'],
      maxProperties: json['maxProperties'],
      minProperties: json['minProperties'],
      definitions:
          json['definitions'] != null
              ? (json['definitions'] as Map<String, dynamic>).map(
                (k, v) => MapEntry(k, JsonSchema4.fromJson(v)),
              )
              : null,
      patternProperties:
          json['patternProperties'] != null
              ? (json['patternProperties'] as Map<String, dynamic>).map(
                (k, v) => MapEntry(k, JsonSchema4.fromJson(v)),
              )
              : null,
      dependencies:
          json['dependencies'] != null
              ? (json['dependencies'] as Map<String, dynamic>).map(
                (k, v) => MapEntry(k, JsonSchema4.fromJson(v)),
              )
              : null,
      additionalProperties:
          json['additionalProperties'] != null
              ? JsonSchema4.fromJson(json['additionalProperties'])
              : null,
      additionalItems:
          json['additionalItems'] != null
              ? JsonSchema4.fromJson(json['additionalItems'])
              : null,
      propertyNames:
          json['propertyNames'] != null
              ? JsonSchema4.fromJson(json['propertyNames'])
              : null,
      contains:
          json['contains'] != null
              ? JsonSchema4.fromJson(json['contains'])
              : null,
      constValue: json['const'],
      examples:
          json['examples'] != null
              ? (json['examples'] as List)
                  .map((e) => JsonSchema4.fromJson(e))
                  .toList()
              : null,
      extensions: json['extensions'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      r'$schema': $schema,
      'title': title,
      'description': description,
      'type': type,
      'required': required,
      'properties': properties?.map((k, v) => MapEntry(k, v.toJson())),
      'items': items?.toJson(),
      'allOf': allOf?.map((e) => e.toJson()).toList(),
      'anyOf': anyOf?.map((e) => e.toJson()).toList(),
      'oneOf': oneOf?.map((e) => e.toJson()).toList(),
      'not': not?.toJson(),
      'default': defaultValue,
      'enum': enumValues,
      'format': format,
      'readOnly': readOnly,
      'writeOnly': writeOnly,
      'deprecated': deprecated,
      'multipleOf': multipleOf,
      'maximum': maximum,
      'exclusiveMaximum': exclusiveMaximum,
      'minimum': minimum,
      'exclusiveMinimum': exclusiveMinimum,
      'maxLength': maxLength,
      'minLength': minLength,
      'pattern': pattern,
      'maxItems': maxItems,
      'minItems': minItems,
      'uniqueItems': uniqueItems,
      'maxProperties': maxProperties,
      'minProperties': minProperties,
      'definitions': definitions?.map((k, v) => MapEntry(k, v.toJson())),
      'patternProperties': patternProperties?.map(
        (k, v) => MapEntry(k, v.toJson()),
      ),
      'dependencies': dependencies?.map((k, v) => MapEntry(k, v.toJson())),
      'additionalProperties': additionalProperties?.toJson(),
      'additionalItems': additionalItems?.toJson(),
      'propertyNames': propertyNames?.toJson(),
      'contains': contains?.toJson(),
      'const': constValue,
      'examples': examples?.map((e) => e.toJson()).toList(),
      'extensions': extensions,
    };
  }
}
