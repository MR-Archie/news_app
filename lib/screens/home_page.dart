// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/news_controller.dart';
import '../Widgets/news_layout.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Center(
            child: Text(
              "The  News  Hub",
              style: GoogleFonts.goblinOne(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
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
          bottom: const TabBar(
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: "Home",
                ),
                Tab(
                  icon: Icon(
                    Icons.phone_android_outlined,
                  ),
                  text: "Tech",
                ),
                Tab(
                  icon: Icon(Icons.business_outlined),
                  text: "Business",
                ),
                Tab(
                  icon: Icon(Icons.bookmark_add_outlined),
                  text: "Saved",
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            GetX<NewsController>(
              builder: (controller) {
                if (controller.isLoading == true) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListView.builder(
                      itemBuilder: ((context, index) {
                        return NewsLayout(
                            controller.newsList[index].author,
                            controller.newsList[index].title,
                            controller.newsList[index].description,
                            controller.newsList[index].urlToImage,
                            controller.newsList[index].content);
                      }),
                      itemCount: controller.newsList.length,
                    ),
                  );
                }
              },
            ),
            Icon(Icons.phone_android_outlined),
            Icon(Icons.business_outlined),
            Icon(Icons.bookmark_add_outlined),
          ],
        ),
      ),
    );
  }
}
