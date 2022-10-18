// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsLayout extends StatelessWidget {
  final String? author, title, description, image, content;
  const NewsLayout(
      this.author, this.title, this.description, this.image, this.content);

  @override
  Widget build(BuildContext context) {
    return (author != null &&
            description != null &&
            image != null &&
            title != null &&
            content != null)
        ? Container(
            padding: const EdgeInsets.all(3),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5, left: 5, right: 5, bottom: 2),
                  child: Image.network(
                    image!,
                    fit: BoxFit.cover,
                  ),
                ),
                Card(
                  borderOnForeground: true,
                  child: Text(
                    description!,
                    style: GoogleFonts.averageSans(fontWeight: FontWeight.w900),
                  ),
                ),
                const Divider(color: Colors.indigo, thickness: 3),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
          )
        : Container();
  }
}
