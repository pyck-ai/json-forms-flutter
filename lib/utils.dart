typedef JsonFormsCallback = void Function(Map<String, dynamic> data);

dynamic getValueFromPath(Map<String, dynamic> json, List<String> path) {
  dynamic value = json;
  for (String key in path) {
    if (value is Map<String, dynamic> && value.containsKey(key)) {
      value = value[key];
    } else {
      return null;
    }
  }
  return value;
}

void setValueAtPath(
  Map<String, dynamic> json,
  List<String> path,
  dynamic newValue,
) {
  dynamic value = json;
  for (int i = 0; i < path.length - 1; i++) {
    String key = path[i];
    if (value is Map<String, dynamic>) {
      if (!value.containsKey(key)) {
        value[key] = <String, dynamic>{};
      }
      value = value[key];
    } else {
      return;
    }
  }
  value[path.last] = newValue;
}

String properties = "properties";

List<String> getParts(String key) {
  List<String> parts = key.split("/");
  parts.removeAt(0);
  parts.removeWhere((part) => part == properties);
  return parts;
}

String camelCaseToWords(String s) {
  final result = s.replaceAllMapped(
    RegExp(r'([A-Z])'),
        (Match m) => ' ${m[1]}',
  );
  return result[0].toUpperCase() + result.substring(1);
}

class RegexPattern {
  static String uri =
      r'^(?!.*[?@!&`()*+,;=_\-~\]\[#$]{2})(?!.*[?@!&`()*+,;=_.\-~:?\[\]]$)(?!.*(\/\.|\.\/))(\w+:(\/\/)?)\S*$';
  static String email = r'^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$';
}
