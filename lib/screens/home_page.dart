import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Center(
          child: Text(
            "The News Hub",
            style: GoogleFonts.robotoCondensed(
                fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
