import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFEDF1D6),
      child: Container(
        child: ListView(children: [
          const SizedBox(height: 5),
          ListTile(
            onTap: () {},
            title: const Text("Home",
                style: TextStyle(
                    color: Color(0xFF52734D),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            leading: const Icon(
              Boxicons.bx_home,
              color: Color(0xFF52734D),
              size: 27,
            ),
          ),
          const SizedBox(height: 3),
          ListTile(
            onTap: () {},
            title: const Text("category 1",
                style: TextStyle(
                    color: Color(0xFF52734D),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            leading: const Icon(
              Boxicons.bx_home,
              color: Color(0xFF52734D),
              size: 27,
            ),
          ),
          ListTile(
            onTap: () {},
            title: const Text("category 2",
                style: TextStyle(
                    color: Color(0xFF52734D),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            leading: const Icon(
              Boxicons.bx_home,
              color: Color(0xFF52734D),
              size: 27,
            ),
          ),
          ListTile(
            onTap: () {},
            title: const Text("category 3",
                style: TextStyle(
                    color: Color(0xFF52734D),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            leading: const Icon(
              Boxicons.bx_home,
              color: Color(0xFF52734D),
              size: 27,
            ),
          ),
          const SizedBox(height: 3),
          ListTile(
            onTap: () {},
            title: const Text("Logout",
                style: TextStyle(
                    color: Color(0xFF52734D),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            leading: const Icon(
              Boxicons.bxs_log_out,
              color: Color(0xFF52734D),
              size: 27,
            ),
          )
        ]),
      ),
    );
  }
}
