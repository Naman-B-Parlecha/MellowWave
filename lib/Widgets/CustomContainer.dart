import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mellow_wave/Screens/MusicScreen.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    required this.name,
    required this.backimage,
    Key? key,
  }) : super(key: key);

  final String name;
  final String backimage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black, // Set the background color to black
        image: DecorationImage(
          image: AssetImage(backimage),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      width: 200,
      height: 250,
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MusicScreen(),
          ));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xFFBBE1FA).withOpacity(0.5)),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10, bottom: 10),
              child: Text(
                name,
                style: GoogleFonts.exo2(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1B262C)),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
