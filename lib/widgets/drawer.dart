import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer(
      {super.key, required this.drawerIndex, required this.onTap});

  final int drawerIndex;
  final Function(int) onTap;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Builder(builder: (context) {
        return ListView(
          children: [
            DrawerHeader(
              child: Text(
                "Menu",
                style: GoogleFonts.dmSerifDisplay(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                "Hero",
              ),
              selected: widget.drawerIndex == 0,
              onTap: () {
                widget.onTap(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                "Header",
              ),
              selected: widget.drawerIndex == 1,
              onTap: () {
                widget.onTap(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                "Bottom Nav",
              ),
              selected: widget.drawerIndex == 2,
              onTap: () {
                widget.onTap(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                "Floating Button",
              ),
              selected: widget.drawerIndex == 3,
              onTap: () {
                widget.onTap(3);
                Navigator.pop(context);
              },
            ),
          ],
        );
      }),
    );
  }
}
