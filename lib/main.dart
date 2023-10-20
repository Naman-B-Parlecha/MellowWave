import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mellow_wave/Screens/LoadingScreen.dart';
import 'package:mellow_wave/Screens/homeScreen.dart';
import 'package:mellow_wave/Screens/SignUpScreen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final lofiTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme(
    primary: Color(0xFFEFC28D), // Primary color (background)
    secondary: Color(0xFF292541), // Secondary color (buttons, etc.)
    background: Color(0xFF48426D), // Updated background color using F1ECC3
    surface: Color(0xFF57837B), // Accents/Highlights
    error: Color.fromARGB(255, 161, 46, 46), // Soft red for error
    onPrimary: Colors.white, // Text on primary (light color for contrast)
    onSecondary: Colors.black, // Text on secondary (dark color for contrast)
    onBackground: Colors.black, // Text on background (dark color for contrast)
    onSurface: Colors.white, // Text on surface (light color for contrast)
    onError: Colors.white, // Text on error (light color for contrast)
    brightness: Brightness.light, // Use light theme
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: lofiTheme,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingScreen();
            }
            if (snapshot.hasData) {
              return const HomeScreen();
            }
            return const SignUpScreen();
          },
        ));
  }
}
