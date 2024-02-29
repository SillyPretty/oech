import 'package:flutter/cupertino.dart';

class SendPackageWidget2 extends StatelessWidget {
  final String name; 
  final String item;
  const SendPackageWidget2({super.key, required this.name, required this.item});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(color: Color(0xffa7a7a7), fontSize: 16,),),
          Text(item, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xffEC8000), fontSize: 16,),),
        ],
      ),
    );
  }
}