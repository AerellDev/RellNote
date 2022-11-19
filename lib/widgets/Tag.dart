import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class Tag extends StatelessWidget {
  HexColor hexColor;
  String tagName;

  Tag({super.key, required this.hexColor, required this.tagName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: hexColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        tagName,
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
