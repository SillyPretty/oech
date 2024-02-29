import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rich/model/send_a_package_model.dart';
import 'package:rich/pages/session_4/send_a_package_3.dart';
import 'package:rich/widgets/auth_btn.dart';

class TrackingPage extends StatelessWidget {
  const TrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 340,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/tracking/map.jpg'), fit: BoxFit.cover,)
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Tracking Number', style: TextStyle(color: Color(0xff3a3a3a),fontSize: 16, fontWeight: FontWeight.w500,),),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SvgPicture.asset('assets/tracking/sun.svg'),
                      const Text(' R-7458-4567-4434-5854', style: TextStyle(color: Color(0xff0560FA), fontSize: 16, ),),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text('Package Status', style: TextStyle(color: Color(0xffA7A7A7),),),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(width: 14, height: 14, decoration: const BoxDecoration(color: Color(0xff0560FA),),
                            child: const Icon(Icons.check, size: 14, color: Colors.white,),
                          ),
                          Container(
                            height: 34,
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.5, color: const Color(0xffA7A7A7),),
                            ),
                          ),
                          Container(width: 14, height: 14, decoration: const BoxDecoration(color: Color(0xff0560FA),),
                            child: const Icon(Icons.check, size: 14, color: Colors.white,),
                          ),
                          Container(
                            height: 34,
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.5, color: const Color(0xffA7A7A7),),
                            ),
                          ),Container(width: 14, height: 14, decoration: BoxDecoration(border: Border.all(color: const Color(0xff0560FA),)),
                          ),
                          Container(
                            height: 34,
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.5, color: const Color(0xffA7A7A7),),
                            ),
                          ),
                          Container(width: 14, height: 14, decoration: const BoxDecoration(color: Color(0xffE0E0E0),),),
                        ],
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Courier requested', style: TextStyle(color: Color(0xffA7A7A7), fontSize: 14,),),
                          Text('July 7 2022 08:00am', style: TextStyle(color: Color(0xffEC8000), fontSize: 12,),),
                          SizedBox(height: 12),
                          Text('Package ready for delivery', style: TextStyle(color: Color(0xffA7A7A7), fontSize: 14,),),
                          Text('July 7 2022 08:30am', style: TextStyle(color: Color(0xffEC8000), fontSize: 12,),),
                          SizedBox(height: 12),
                          Text('Package in transit', style: TextStyle(color: Color(0xff0560FA), fontSize: 14,),),
                          Text('July 7 2022 08:00am', style: TextStyle(color: Color(0xffEC8000), fontSize: 12,),),
                          SizedBox(height: 12),
                          Text('Package delivered', style: TextStyle(color: Color(0xffA7A7A7), fontSize: 14,),),
                          Text('July 7 2022 10:30am', style: TextStyle(color: Color(0xffA7A7A7), fontSize: 12,),),
                          SizedBox(height: 12),
                        ],
                      ),
                    ],
                  ), 
                  const SizedBox(height: 20), 
                  InkWell(onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SendPackagePage3(date: SendPackageModel(adress: 'Mbaraugba', country: 'Abia State', phone: '+234 56543 96854', others: '', adress2: 'Ademola', country2: 'Lagos', others2: '', phone2: '+234 70644 80655', items: 'Books and stationary', weight: '1000kg', worth: 'N50,000'),),),
                    );
                  },
                  child: const AuthButtonWidget(content: 'View Package Info', color: Color(0xff0560FA), textColor: Colors.white))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}