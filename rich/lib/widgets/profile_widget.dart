import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String img;

  const ProfileWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      width: double.infinity,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(img),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(58, 58, 58, 1),
                ),
              ),
              const SizedBox(height: 3),
              subTitle != '' ? Text(
                subTitle,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ): const SizedBox(),
            ],
          ),
          const Spacer(),
          const Icon(Icons.keyboard_arrow_right_sharp),
        ],
      ),
    );
  }
}