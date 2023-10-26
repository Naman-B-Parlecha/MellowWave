import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF292541),
      child: Container(
        child: ListView(children: [
          const SizedBox(height: 5),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
            },
            title: const Text("Home",
                style: TextStyle(
                    color: Color(0xFFEFC28D),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            leading: const Icon(
              Boxicons.bx_home,
              color: Color(0xFFEFC28D),
              size: 27,
            ),
          ),
          const SizedBox(height: 3),
          ListTile(
            onTap: () {
              const link = 'https://github.com/Naman-Parlecha/MellowWave';
              launchUrl(Uri.parse(link), mode: LaunchMode.inAppWebView);
            },
            title: const Text("source code",
                style: TextStyle(
                    color: Color(0xFFEFC28D),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            leading: const Icon(
              Boxicons.bxl_github,
              color: Color(0xFFEFC28D),
              size: 27,
            ),
          ),
          ListTile(
            onTap: () {
              Share.share('com.example.mellow_wave');
            },
            title: const Text("share app",
                style: TextStyle(
                    color: Color(0xFFEFC28D),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            leading: const Icon(
              Boxicons.bx_share_alt,
              color: Color(0xFFEFC28D),
              size: 27,
            ),
          ),
          // ListTile(
          //   onTap: () {},
          //   title: const Text("category 3",
          //       style: TextStyle(
          //           color: Color(0xFFEFC28D),
          //           fontSize: 20,
          //           fontWeight: FontWeight.bold)),
          //   leading: const Icon(
          //     Boxicons.bx_home,
          //     color: Color(0xFFEFC28D),
          //     size: 27,
          //   ),
          // ),
          const SizedBox(height: 3),
          ListTile(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            title: const Text("Logout",
                style: TextStyle(
                    color: Color(0xFFEFC28D),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            leading: const Icon(
              Boxicons.bxs_log_out,
              color: Color(0xFFEFC28D),
              size: 27,
            ),
          )
        ]),
      ),
    );
  }
}
