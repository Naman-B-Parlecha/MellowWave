import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() {
    return _MusicScreenState();
  }
}

class _MusicScreenState extends State<MusicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF57837B),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Boxicons.bx_arrow_back),
          color: Color(0xFFF1ECC3),
        ),
      ),
      body: Center(
        child: Text(
          "Under Construction",
          style: GoogleFonts.exo2(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1B262C)),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
