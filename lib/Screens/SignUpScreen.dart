import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  int screennumber = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Image.asset(
                'assets/images/music.jpg',
                height: 465,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 50, left: 10, right: 10, bottom: 15),
                  height: 450,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25)),
                      color: Color(0xFF57837B)),
                  child: Column(
                    children: [
                      Text(
                        "Welcome to MellowWave",
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Relax and enjoy Lofi beats\neffortlessly.",
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 70),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.all(16.0),
                        ),
                        onPressed: () {},
                        child: Container(
                          width: 250,
                          alignment: Alignment.center,
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.montserrat(
                                color: const Color(0xFF515E63),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        margin: const EdgeInsets.only(left: 70),
                        child: Row(
                          children: [
                            Text(
                              "Already have an account?",
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Sign in",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                    color: Colors.white,
                                  ),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}
