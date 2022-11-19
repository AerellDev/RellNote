import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:provider/provider.dart';
import 'package:rellnote/provider/catatan.dart';
import 'package:rellnote/tambahan.dart';

import 'provider/tags.dart';
import 'widgets/CatatanTab.dart';
import 'widgets/Tag.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => CatatanProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => TagsProvider(),
      )
    ],
    child: const RellNote(),
  ));
}

class RellNote extends StatelessWidget {
  const RellNote({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController kolomPencarianController =
        TextEditingController();
    final catatanProvider =
        Provider.of<CatatanProvider>(context, listen: false);
    final tagsProvider = Provider.of<TagsProvider>(context, listen: false);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: generateMaterialColor(
                color: const Color.fromARGB(255, 226, 51, 38))),
        home: SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                //Kolom Pencarian
                Container(
                  margin: const EdgeInsets.all(5),
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black.withOpacity(0.3))),
                  child: TextField(
                    controller: kolomPencarianController,
                    style: const TextStyle(fontSize: 15),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: 10, right: 10, bottom: 14, top: 5),
                        hintText: "Cari...",
                        border: InputBorder.none),
                    onChanged: (value) {
                      catatanProvider.Search(value);
                    },
                    onSubmitted: (value) {
                      catatanProvider.Search(value);
                    },
                  ),
                ),
                //Tempat Catatan
                Expanded(
                  child: Consumer<CatatanProvider>(
                    builder: (context, value, child) => ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        for (int i = 0; i < value.catatan.length; i++) ...[
                          CatatanTab(
                            bgColor: Colors.white,
                            judul: value.catatan[i]['judul'],
                            isi: value.catatan[i]['isi'],
                            tags: [
                              for (int a = 0;
                                  a < value.catatan[i]['tags'].length;
                                  a++) ...[
                                Tag(
                                    hexColor: HexColor(
                                        value.catatan[i]['tags'][a]['color']),
                                    tagName: value.catatan[i]['tags'][a]
                                        ['nama'])
                              ]
                            ],
                          ),
                        ]
                      ],
                    ),
                  ),
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.note_add_rounded),
              onPressed: () {},
            ),
          ),
        ));
  }
}

class CatatanView extends StatelessWidget {
  const CatatanView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_rounded))
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: Color.fromARGB(255, 193, 193, 193))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Judul",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const Divider(),
                  Text(
                    "Isi",
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Divider(),
                  //Tempat Tag Buat Catatan nya
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
