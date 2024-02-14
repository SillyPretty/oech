import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 4.0,
        title:  Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 30),
          child: Text('Notification',
          style: TextStyle(
            color: Color(0xffa3a3a3),
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
          // 
          // jihiho
          // 
          // kljjpjp
          
          children: [
            SizedBox(height: 120,),
            Container(
              width: 83,
              height: 83,
              child: SvgPicture.asset('assets/images/s3_notification.svg'),),
              SizedBox(height: 18,),
            Text('You have no notification',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xff3a3a3a)
            ),)
          ],
          
        ),
      ),
      ),
    );
  }
}

