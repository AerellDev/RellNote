import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../tambahan.dart';

class TagsProvider with ChangeNotifier {
  
  dynamic _tags = {};

  dynamic get tags => _tags;

  TagsProvider() {
    readFileToString("data/tags.json").then((value) async {
      _tags = await json.decode(value);
      notifyListeners();
    });
  }

}