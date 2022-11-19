import 'package:flutter/material.dart';
import 'package:rellnote/main.dart';

import 'Tag.dart';

class CatatanTab extends StatelessWidget {
  Color bgColor;
  String judul;
  String isi;
  List<Tag> tags = const <Tag>[];

  CatatanTab(
      {super.key,
      required this.bgColor,
      required this.isi,
      required this.judul,
      required this.tags});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Material(
        color: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(color: Color.fromARGB(255, 193, 193, 193)),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: (() {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CatatanView(),));
          }),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  judul,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Divider(),
                Text(
                  isi,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                const Divider(),
                //Tempat Tag Buat Catatan nya
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: tags,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
