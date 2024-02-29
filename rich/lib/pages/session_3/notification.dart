import 'package:flutter/material.dart';
import '../../widgets/app_bar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 4.0,
        centerTitle: true,
        title: const AppBarWidget(
          text: 'Notification',
          isBack: true,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 120),
          Center(child: Image.asset('assets/notification/img.png')),
          const SizedBox(height: 10),
          const Text('You have no notifications',
            style: TextStyle(color: Color(0xff3a3a3a),fontWeight: FontWeight.w500,fontSize: 16,),
          )
        ],
      ),
    );
  }
}