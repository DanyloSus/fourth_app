import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar(
      {super.key, required this.onItemTapped, required this.selectedIndex});

  final Function(int) onItemTapped;
  final int selectedIndex;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.selectedIndex,
      selectedItemColor: Colors.black,
      onTap: widget.onItemTapped,
      items: const [
        BottomNavigationBarItem(
            label: 'Item One',
            icon: Icon(Icons.home),
            backgroundColor: Colors.amberAccent),
        BottomNavigationBarItem(
          label: 'Item Two',
          icon: Icon(Icons.apps),
          backgroundColor: Colors.deepPurple,
        ),
        BottomNavigationBarItem(
          label: 'Item Three',
          icon: Icon(Icons.chat_bubble),
          backgroundColor: Colors.purpleAccent,
        ),
      ],
    );
  }
}
