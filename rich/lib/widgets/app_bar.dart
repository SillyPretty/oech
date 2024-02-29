import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final bool isBack;
  final String text;
  const AppBarWidget({
    super.key,
    required this.text,
    required this.isBack,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isBack
            ? InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset('assets/icon_arrow-right.png'),
              )
            : const SizedBox(width: 24),
        Text(
          text,
          style: const TextStyle(
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