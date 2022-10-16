// ignore_for_file: unnecessary_null_comparison

import 'package:get/get.dart';
import '../services/remote_service.dart';
import '../models/news.dart';

class NewsController extends GetxController {
  var newsList = <Article>[].obs;
  @override
  void onInit() {
    loadNews();
    super.onInit();
  }

  void loadNews() async {
    var news = await RemoteService.fetchNews();

    if (news != null) {
      newsList.value = news;
    }
  }
}
