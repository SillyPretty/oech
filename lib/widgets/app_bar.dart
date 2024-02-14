import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final text;
  const AppBarWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Image.asset('assets/images/s5_icon_arrow-left.png'),
        ),
        Text(
          text,
          style: TextStyle(
            color: Color(0xffA7A7A7),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 24),
      ],
    );
  }
}
