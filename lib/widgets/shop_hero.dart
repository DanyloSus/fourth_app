import 'package:flutter/material.dart';
import 'package:fourth_app/widgets/shop_item.dart';

import './photo_hero.dart';

class ShopHero extends StatefulWidget {
  const ShopHero(
      {super.key,
      required this.addGrandma,
      required this.countOfGrandmas,
      required this.addFarm,
      required this.addMine,
      required this.countOfFarms,
      required this.countOfMines});

  final void Function() addGrandma, addFarm, addMine;
  final int countOfGrandmas, countOfFarms, countOfMines;

  @override
  State<ShopHero> createState() => _ShopHeroState();
}

class _ShopHeroState extends State<ShopHero> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: PhotoHero(
        photo:
            'https://static.wikia.nocookie.net/cookieclicker/images/5/5a/PerfectCookie.png/revision/latest?cb=20130827014912',
        isInternet: true,
        width: 300.0,
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute<void>(builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Shop'),
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
                      photo:
                          'https://static.wikia.nocookie.net/cookieclicker/images/5/5a/PerfectCookie.png/revision/latest?cb=20130827014912',
                      isInternet: true,
                      width: double.infinity,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ShopItem(
                    countOfItem: widget.countOfGrandmas,
                    addItem: widget.addGrandma,
                    startPrice: 100,
                    img:
                        "https://static.wikia.nocookie.net/cookieclicker/images/a/a0/GrandmaIconTransparent.png/revision/latest?cb=20230716022947",
                    name: "Grandma",
                  ),
                  ShopItem(
                    countOfItem: widget.countOfFarms,
                    addItem: widget.addFarm,
                    startPrice: 500,
                    img:
                        "https://static.wikia.nocookie.net/cookieclicker/images/1/1a/FarmIconTransparent.png/revision/latest?cb=20230716020747",
                    name: "Farm",
                  ),
                  ShopItem(
                    countOfItem: widget.countOfMines,
                    addItem: widget.addMine,
                    startPrice: 1000,
                    img:
                        "https://static.wikia.nocookie.net/cookieclicker/images/f/f2/MineIconTransparent.png/revision/latest?cb=20230716021745",
                    name: "Mine",
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
