import 'package:flutter/material.dart';

class BottoomItem {
  BottomNavigationBarItem bottomItem(
      int currentIndex, int index, IconData icon) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            width: 30,
            height: 4,
            decoration: BoxDecoration(
              color: currentIndex == index ? Colors.amber : Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          Icon(icon),
        ],
      ),
      label: '',
    );
  }
}
