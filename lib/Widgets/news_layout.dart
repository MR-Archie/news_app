// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            content != null &&
            url != null)
        ? InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/description', arguments: {
                "author": author,
                "title": title,
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
                borderRadius: BorderRadius.circular(9),
              ),
              child: Row(
                children: [
                  Container(
                    height: 250,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.tealAccent,
                    ),
                    padding: const EdgeInsets.all(3),
                    child: Image.network(
                      image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      width: 180,
                      height: 240,
                      child: Text(
                        title!,
                        maxLines: 7,
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700, fontSize: 20),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        : Container();
  }
}
