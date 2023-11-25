import 'dart:convert';

jsonPretty(Object object) {
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');
  String prettyprint = encoder.convert(object);
  return prettyprint;
}
