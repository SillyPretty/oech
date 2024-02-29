// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BottomBarWidget {
  final String text;
  bool isActive;

  BottomBarWidget({
    required this.text,
    this.isActive = false,
  });

  void toggleActiveState() {
    isActive = !isActive;
  }

  String getTextColor() {
    return isActive ? 'assets/icons/${text.toLowerCase().toString()}-active.png' : 'assets/icons/${text.toLowerCase().toString()}.png';
  }

  BottomNavigationBarItem toBottomNavigationBarItem() {
    return BottomNavigationBarItem(
      icon: SizedBox(
        width: 24,
        height: 24,
        child: Center(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Image.asset(getTextColor()),
              ),
              if (isActive)
                Container(
                  height: 3.0,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(5, 96, 205, 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(3),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      label: text,
    );
  }
}