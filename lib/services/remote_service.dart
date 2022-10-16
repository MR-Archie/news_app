import 'package:http/http.dart' as http;
import '../models/news.dart';

class RemoteService {
  static var client = http.Client();

  static Future<List<Article>?> fetchNews() async {
    var response = await client.get(Uri.parse(
        'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=ef1191ebf36b4d10bc40e7144186eef0'));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return newsFromJson(jsonString).articles;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
