// To parse this JSON data, do
//
//     final newsConvert = newsConvertFromJson(jsonString);

import 'dart:convert';

NewsConvert newsConvertFromJson(String str) =>
    NewsConvert.fromJson(json.decode(str));

String newsConvertToJson(NewsConvert data) => json.encode(data.toJson());

class NewsConvert {
  NewsConvert({
    required this.author,
    required this.content,
    required this.description,
    required this.image,
    required this.title,
    required this.url,
  });

  String author;
  String content;
  String description;
  String image;
  String title;
  String url;

  factory NewsConvert.fromJson(Map<String, dynamic> json) => NewsConvert(
        author: json["author"],
        content: json["content"],
        description: json["description"],
        image: json["image"],
        title: json["title"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "content": content,
        "description": description,
        "image": image,
        "title": title,
        "url": url,
      };
}
