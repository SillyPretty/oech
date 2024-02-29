import 'package:flutter/material.dart';
import 'package:rich/widgets/app_bar.dart';
import 'package:rich/widgets/send_package_widget_2.dart';

import '../../model/send_a_package_model.dart';

class SendPackagePage3 extends StatelessWidget {
  final SendPackageModel date;
  const SendPackagePage3({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 4.0,
        centerTitle: true,
        title: const AppBarWidget(text: 'Send a package', isBack: true)
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text('Package Information', style: TextStyle(color: Color(0xff0560FA), fontSize: 20, fontWeight: FontWeight.w500,),),
              const SizedBox(height: 10),
              const Text('Origin details', style: TextStyle(fontSize: 16, color: Color(0xff3a3a3a),),),
              Text('${date.country}, ${date.adress}', style: const TextStyle(color: Color(0xffA7A7A7), fontSize: 16,),),
              Text(date.phone, style: const TextStyle(color: Color(0xffA7A7A7), fontSize: 16,),),
              const SizedBox(height: 8),
              date.adress2 != '' ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Destination details', style: TextStyle(fontSize: 16, color: Color(0xff3a3a3a),),),
                  Text('${date.country}, ${date.adress}', style: const TextStyle(color: Color(0xffA7A7A7), fontSize: 16,),),
                  Text(date.phone, style: const TextStyle(color: Color(0xffA7A7A7), fontSize: 16,),),
                ],
              ) : const SizedBox(),
              const SizedBox(height: 10),
              const Text('Other details', style: TextStyle(fontSize: 16, color: Color(0xff3a3a3a)),),
              SendPackageWidget2(item: date.items, name: 'Package Items'),
              SendPackageWidget2(item: date.weight, name: 'Weight of items'),
              SendPackageWidget2(item: date.worth, name: 'Worth of Items'),
              const SendPackageWidget2(item: 'R-7458-4567-4434-5854', name: 'Tracking Number'),
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
              const SizedBox(height: 10),
              const Text('Click on  delivered for successful delivery and rate rider or report missing item', style: TextStyle(color: Color(0xff2F80ED), fontSize: 12,),),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
                  InkWell(
                    onTap: (){
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 14),
                      decoration: BoxDecoration(
                        border: Border.all(color:  const Color(0xff0560FA),),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text('Report', style: TextStyle(color: Color(0xff0560FA), fontSize: 20, fontWeight: FontWeight.w700),),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed('/finaltransactionsucces1');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 14),
                      decoration: BoxDecoration(
                        color:  const Color(0xff0560FA),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text('Successful', style: TextStyle(color: Color(0xffffffff), fontSize: 20, fontWeight: FontWeight.w700),),
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