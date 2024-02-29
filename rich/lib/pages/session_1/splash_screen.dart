import 'dart:async';

import 'package:flutter/material.dart';

class SpalshScreenWidget extends StatefulWidget {
  const SpalshScreenWidget({super.key});

  @override
  State<SpalshScreenWidget> createState() => _SpalshScreenWidgetState();
}

class _SpalshScreenWidgetState extends State<SpalshScreenWidget> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2),() {
      Navigator.of(context).pushReplacementNamed('/onboarding1');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
            child: Image.asset('assets/splash.png'),
            ),
        );
  }
}