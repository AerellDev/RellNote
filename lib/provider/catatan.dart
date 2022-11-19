import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:rellnote/tambahan.dart';

class CatatanProvider with ChangeNotifier {
  List _catatan = [];

  List get catatan => _catatan;

  CatatanProvider() {
    LoadFileCatatan();
  }

  LoadFileCatatan() {
    readFileToString("data/catatan.json").then((value) async {
      _catatan = await json.decode(value);
      notifyListeners();
    });
  }

  Search(String cari) {
    if(cari.isNotEmpty) {
      _catatan = _catatan
        .where((element) =>
            element['judul']
                .toString()
                .toLowerCase()
                .contains(cari.toLowerCase()) ||
            element['isi']
                .toString()
                .toLowerCase()
                .contains(cari.toLowerCase()) ||
            element['tags']
                .toString()
                .toLowerCase()
                .contains(cari.toLowerCase()))
        .toList();
        notifyListeners();
    }else{
      LoadFileCatatan();
    }
    
  }
}
