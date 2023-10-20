import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicControlBox extends StatelessWidget {
  const MusicControlBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFF292541),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      width: 350,
      height: 175,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Ghost in Mist',
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              'softy',
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Container(
              width: 300,
              child: const LinearProgressIndicator(
                value: 0.30,
                backgroundColor: Color(0xFF48426D),
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFEFC28D)),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Boxicons.bx_shuffle,
                      size: 30,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Boxicons.bx_chevrons_left,
                      size: 45,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Boxicons.bx_pause,
                      size: 45,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Boxicons.bx_chevrons_right,
                      size: 45,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Boxicons.bx_pulse,
                      size: 35,
                    ))
              ],
            )
          ]),
    );
  }
}
