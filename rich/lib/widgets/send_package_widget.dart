import 'package:flutter/material.dart';

class SendPackageWidget extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  final TextInputType decoration;
  const SendPackageWidget({
    super.key,
    this.inputType = TextInputType.text,
    required this.controller,
    required this.hintText,
    this.decoration = TextInputType.streetAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffcfcfcf),
                      blurRadius: 1,
                      offset: Offset(0,4), 
                    ),
                  ],
                ),
                child:  TextField(
                  keyboardType: decoration,
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(8),
                    hintStyle: const TextStyle(color: Color(0xffCFCFCF), fontSize: 12),
                  ),
                  style: const TextStyle(fontSize: 12),
                ),
              );
  }
}