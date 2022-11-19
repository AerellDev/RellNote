import 'dart:convert';

import 'package:flutter/services.dart';

Future<String> readFileToString(String path) async {
  final String response = await rootBundle.loadString(path);
  final data = response;
  return data;
}
