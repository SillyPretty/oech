import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rich/widgets/send_package_widget_2.dart';
import '../../model/send_a_package_model.dart';
import '../../widgets/app_bar.dart';

class SendPackagePage2 extends StatefulWidget {
  final SendPackageModel date;
  const SendPackagePage2({super.key, required this.date});

  @override
  State<SendPackagePage2> createState() => _SendPackagePage2State();
}

class _SendPackagePage2State extends State<SendPackagePage2> {
  @override
  void initState() {
    super.initState();
    code = generateCode();  
  }
  String generateCode() {
    String code = 'R';
    Random random = Random();
      for (int j = 0; j < 4; j++) {
        code += '-';
        code += random.nextInt(9000).toString();
      }
    return code;
  }
  String code = '';
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
          text: 'Send a package',
          isBack: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Package Information', style: TextStyle(color: Color(0xff0560FA), fontSize: 20, fontWeight: FontWeight.w500,),),
              const SizedBox(height: 10),
              const Text('Origin details', style: TextStyle(fontSize: 16, color: Color(0xff3a3a3a),),),
              Text('${widget.date.country}, ${widget.date.adress}', style: const TextStyle(color: Color(0xffA7A7A7), fontSize: 16,),),
              Text(widget.date.phone, style: const TextStyle(color: Color(0xffA7A7A7), fontSize: 16,),),
              const SizedBox(height: 8),
              widget.date.adress2 != '' ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Destination details', style: TextStyle(fontSize: 16, color: Color(0xff3a3a3a),),),
                  Text('${widget.date.country}, ${widget.date.adress}', style: const TextStyle(color: Color(0xffA7A7A7), fontSize: 16,),),
                  Text(widget.date.phone, style: const TextStyle(color: Color(0xffA7A7A7), fontSize: 16,),),
                ],
              ) : const SizedBox(),
              const SizedBox(height: 10),
              const Text('Other details', style: TextStyle(fontSize: 16, color: Color(0xff3a3a3a)),),
              SendPackageWidget2(item: widget.date.items, name: 'Package Items'),
              SendPackageWidget2(item: widget.date.weight, name: 'Weight of items'),
              SendPackageWidget2(item: widget.date.worth, name: 'Worth of Items'),
              SendPackageWidget2(item: code, name: 'Tracking Number'),
              const SizedBox(height: 35),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffA7A7A7),
                    width: 0.5,
                  )
                ),
              ),
              const SizedBox(height: 10),
              const Text('Charges', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xff0560FA)),),
              const SendPackageWidget2(name: 'Delivery Charges', item: 'N2,500.00'),
              const SendPackageWidget2(name: 'Instant delivery', item: 'N300.00'),
              const SendPackageWidget2(name: 'Tax and Service Charges', item: 'N200.00'),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffA7A7A7),
                    width: 0.5,
                  )
                ),
              ),
              const SendPackageWidget2(name: 'Package total', item: 'N3000.00'),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 14),
                      decoration: BoxDecoration(
                        border: Border.all(color:  const Color(0xff0560FA),),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text('Edit package', style: TextStyle(color: Color(0xff0560FA), fontSize: 20, fontWeight: FontWeight.w700),),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed('/transactionsucces1', arguments: code,);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      decoration: BoxDecoration(
                        color:  const Color(0xff0560FA),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text('Make payment', style: TextStyle(color: Color(0xffffffff), fontSize: 20, fontWeight: FontWeight.w700),),
                    ),
                  ),
                ], 
              ),
            ],
          ),
        ),
      ),
    );
  }
}