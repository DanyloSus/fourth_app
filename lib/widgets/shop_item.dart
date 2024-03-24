import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopItem extends StatefulWidget {
  const ShopItem({
    super.key,
    required this.countOfItem,
    required this.addItem,
    required this.startPrice,
    required this.img,
    required this.name,
  });

  final int countOfItem, startPrice;
  final void Function() addItem;
  final String img, name;

  @override
  State<ShopItem> createState() => _ShopItemState();
}

class _ShopItemState extends State<ShopItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.network(
                widget.img,
                width: 30,
              ),
              Column(
                children: [
                  Text(
                    "Buy ${widget.name}",
                    style: GoogleFonts.dmSerifDisplay(
                      textStyle: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text("You have ${widget.countOfItem}"),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text("Price ${widget.startPrice + widget.countOfItem * 20}"),
              TextButton(
                onPressed: widget.addItem,
                child: Text(
                  "Buy ${widget.name}",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
