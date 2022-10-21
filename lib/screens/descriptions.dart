import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purpleAccent, Colors.blueAccent],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              image!,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                tileMode: TileMode.mirror,
                colors: [Colors.pinkAccent, Colors.tealAccent],
              ),
            ),
            padding: const EdgeInsets.only(left: 5, top: 2),
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
          Container(
            padding: const EdgeInsets.only(left: 5, top: 2),
            child: Center(
              child: Text(
                "- ${author!}",
                style: GoogleFonts.slabo13px(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            child: Container(
              color: Colors.white,
              width: 250,
              height: 300,
              child: Column(
                children: [
                  Text(
                    "𝕯 𝖊 𝖘 𝖈 𝖗 𝖎 𝖕 𝖙 𝖎 𝖔 𝖓 :   ${content!} \n \n Follow the given link to read more about the article :",
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
    );
  }
}
