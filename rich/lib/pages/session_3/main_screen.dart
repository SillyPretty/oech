import 'package:flutter/material.dart';
import 'package:rich/pages/session_3/profile_screen.dart';
import 'package:rich/pages/session_4/tracking_screen.dart';
import 'package:rich/pages/session_4/wallet_screen.dart';

import '../../widgets/Bottom_Bar_Widget.dart';
import '../session_5/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
  
}

List<Widget> listPage = const <Widget>[
  HomePage(),
  WalletPage(),
  TrackingPage(),
  ProfilePage(),
];

int selectedIndex = 0;
int number = 0;

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    number = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(number == 0){
      if (ModalRoute.of(context)?.settings.arguments != null) {
      final yourNumber = ModalRoute.of(context)?.settings.arguments as int;
      selectedIndex = yourNumber;
    }
    number = 1;
    }
    return Scaffold(
      body: listPage[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomBarWidget(
            text: 'Home',
            isActive: selectedIndex == 0,
          ).toBottomNavigationBarItem(),

          BottomBarWidget(
            text: 'Walet',
            isActive: selectedIndex == 1,
          ).toBottomNavigationBarItem(),

          BottomBarWidget(
            text: 'Track',
            isActive: selectedIndex == 2,
          ).toBottomNavigationBarItem(),

          BottomBarWidget(
            text: 'profile',
            isActive: selectedIndex == 3,
          ).toBottomNavigationBarItem(),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
            
          });
        },
        selectedItemColor: const Color.fromRGBO(5, 96, 205, 1),
      ),
    );
  }
}