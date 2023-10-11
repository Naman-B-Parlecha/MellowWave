import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mellow_wave/Widgets/Categorybox.dart';
import 'package:mellow_wave/Widgets/CustomDrawer.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 66, 99, 93),
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 66, 99, 93),
        title: Text(
          '\t\t\t\t\t\tMellow Wave',
          style: GoogleFonts.montserrat(
              color: const Color(0xFFF1ECC3),
              fontWeight: FontWeight.w600,
              fontSize: 25),
        ),
        leading: IconButton(
          icon: const Icon(
            Boxicons.bx_menu,
            color: Color(0xFFF1ECC3),
            size: 27,
          ),
          onPressed: _openDrawer,
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          childAspectRatio: 0.80, // to achieve the 2x4 column (width/height)
        ),
        itemCount: 8, // 8 containers
        itemBuilder: (context, index) {
          return const CustomContainer();
        },
      ),
    );
  }
}
