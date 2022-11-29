// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../tabs/bookmark.dart';
import '../tabs/business.dart';
import '../tabs/tech.dart';
import '../tabs/home.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.blue[200],
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
        body: TabBarView(children: [
          Home(),
          Tech(),
          Business(),
          Bookmarks(),
        ]),
      ),
    );
  }
}
