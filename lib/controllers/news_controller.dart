// ignore_for_file: unnecessary_null_comparison

import 'package:get/get.dart';
import '../services/remote_service.dart';
import '../models/news.dart';

class NewsController extends GetxController {
  var newsList = <Article>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    loadNews();
    super.onInit();
  }

  void loadNews() async {
    try {
      isLoading(true);
      var news = await RemoteService.fetchNews();

      if (news != null) {
        newsList.value = news;
      }
    } finally {
      isLoading(false);
    }
  }
}
