import 'package:http/http.dart' as http;
import '../models/news.dart';

class RemoteService {
  static var client = http.Client();
  final String uri = "";
  static Future<List<Article>?> fetchNews(uri) async {
    var response = await client.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return newsFromJson(jsonString).articles;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
