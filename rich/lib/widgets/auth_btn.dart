import 'package:flutter/material.dart';

class AuthButtonWidget extends StatelessWidget {
  final String content;
  const AuthButtonWidget({super.key, required this.content, required this.color, required this.textColor});
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child:  Center(
                      child:  Text(content, 
                      style: TextStyle(color: textColor, 
                      fontSize: 16, 
                      fontWeight: FontWeight.w700,
                      ),
                      ),
                    ),
                  );
  }
}