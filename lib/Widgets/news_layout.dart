// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/descriptions.dart';

class NewsLayout extends StatelessWidget {
  final String? author, title, description, image, content, url;
  const NewsLayout(this.author, this.title, this.description, this.image,
      this.content, this.url);

  @override
  Widget build(BuildContext context) {
    return (author != null &&
            description != null &&
            image != null &&
            title != null &&
            content != null)
        ? InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/description', arguments: {
                "author": author,
                "image": image,
                "description": description,
                "content": content,
                "url": url,
              });
            },
            child: Card(
              elevation: 3,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9)),
              child: Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Row(
                  children: [
                    Container(
                      height: 250,
                      width: 150,
                      padding: const EdgeInsets.all(3),
                      child: Image.network(image!),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Container(
                        alignment: Alignment.centerRight,
                        width: 180,
                        height: 240,
                        child: Text(
                          title!,
                          maxLines: 7,
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w600, fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Container();
  }
}
