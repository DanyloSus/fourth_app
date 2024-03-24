import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

import './photo_hero.dart';

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PhotoHero(
        photo: 'assets/images/sus.png',
        width: 300.0,
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute<void>(builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Tani Daichi'),
              ),
              body: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                    ),
                    child: PhotoHero(
                      photo: 'assets/images/sus.png',
                      width: double.infinity,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Flutter Developer",
                    style: GoogleFonts.dmSerifDisplay(
                      textStyle: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }));
        },
      ),
    );
  }
}
