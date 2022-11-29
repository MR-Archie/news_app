// ignore_for_file: deprecated_member_use
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/news_convert.dart';

class Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.reference().child('News/');

    void setNews(Map<String, dynamic> news) {
      /*  var f = 0;
      ref.once().then((event) {
        print("News is : $news \n\n");
        late String snapshotData = json.encode(event.snapshot.value);
        late var snapValue = newsConvertFromJson(snapshotData).toJson();
        print("Here the value is : $snapValue");
        if (mapEquals(snapValue, news)) {
          ref.child(snapshotData).remove();
          f = 1;
        }
      });

      if (f == 0) {
        ref.push().set(news);
      }*/

      ref.push().set(news);
    }

    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String?, dynamic>;

    final String? author = args['author'];
    final String? description = args['description'];
    final String? image = args['image'];
    final String? content = args['content'];
    final String? url = args['url'];

    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Center(
            child: Text(
              "The News Hub",
              style: GoogleFonts.goblinOne(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purpleAccent, Colors.tealAccent],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                tileMode: TileMode.repeated,
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                image!,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black)),
                      child: Text(
                        description!,
                        style: GoogleFonts.encodeSans(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Text(
                        "- ${author!}",
                        style: GoogleFonts.slabo13px(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "𝕯 𝖊 𝖘 𝖈 𝖗 𝖎 𝖕 𝖙 𝖎 𝖔 𝖓 :   ${content!.substring(0, content.indexOf("["))} \n \n Follow the given link to read more about the article :",
                      style: GoogleFonts.ptSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(url!),
                  ],
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (() {
            var newsData = args as Map<String, dynamic>;
            setNews(newsData);
          }),
          child: const Icon(
            Icons.bookmark_add_outlined,
          ),
        ));
  }
}
