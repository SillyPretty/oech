import 'package:flutter/material.dart';
import 'package:rich/model/send_a_package_model.dart';
import 'package:rich/pages/session_3/send_a_package_screen2.dart';
import 'package:rich/widgets/send_package_widget.dart';

class SendPackagePage extends StatefulWidget {
  const SendPackagePage({super.key});

  @override
  State<SendPackagePage> createState() => _SendPackagePageState();
}

class _SendPackagePageState extends State<SendPackagePage> {
  final adressController = TextEditingController();
  final countryController = TextEditingController();
  final phoneController = TextEditingController();
  final othersController = TextEditingController();

  final adress2Controller = TextEditingController();
  final country2Controller = TextEditingController();
  final phone2Controller = TextEditingController();
  final others2Controller = TextEditingController();

  final itemsController = TextEditingController();
  final weightController = TextEditingController();
  final worthController = TextEditingController();

  bool destination = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 4.0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/main-page');
              },
              child: Image.asset('assets/icon_arrow-right.png'),
            ),
            const Text(
              'Send a package',
              style: TextStyle(
                color: Color(0xffA7A7A7),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 24),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  Image.asset('assets/send_a_package/origin.png'),
                  const Text('  Origin Details',
                    style: TextStyle(
                      color: Color(0xff3a3a3a),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              SendPackageWidget(controller: adressController, hintText: 'Address'),
              SendPackageWidget(controller: countryController, hintText: 'State,Country'),
              SendPackageWidget(controller: phoneController, hintText: 'Phone number', decoration: TextInputType.phone,),
              SendPackageWidget(controller: othersController, hintText: 'Others'),
              const SizedBox(height: 20),
              destination ? Column(
                children: [
                  Row(
                    children: [
                      Image.asset('assets/send_a_package/map_icon.png'),
                      const Text('  Destination Details',
                        style: TextStyle(
                          color: Color(0xff3a3a3a),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  SendPackageWidget(controller: adress2Controller, hintText: 'Address'),
                  SendPackageWidget(controller: country2Controller, hintText: 'State,Country'),
                  SendPackageWidget(controller: phone2Controller, hintText: 'Phone number', decoration: TextInputType.phone,),
                  SendPackageWidget(controller: others2Controller, hintText: 'Others'),
                  const SizedBox(height: 10),
                ],
              ) : const SizedBox(),
              InkWell(
                onTap: (){
                  destination = !destination;
                  setState(() {});
                },
                child: Row(
                  children: [
                    destination == false ? const Icon(Icons.add_box_outlined, color: Color(0xff0560FA),size: 16,) : const Icon(Icons.delete_outlined, color: Color(0xff0560FA),size: 16,),
                    destination == false ? const Text(' Add destination', style: TextStyle(color: Color(0xffa7a7a7), fontSize: 12),) : const Text(' Delete destination', style: TextStyle(color: Color(0xffa7a7a7), fontSize: 12),)
                  ],
                )
              ),
              const SizedBox(height: 10),
              const Text('Package Details',
                style: TextStyle(
                  color: Color(0xff3a3a3a),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SendPackageWidget(controller: itemsController, hintText: 'package items'),
              SendPackageWidget(controller: weightController, hintText: 'Weight of item(kg)'),
              SendPackageWidget(controller: worthController, hintText: 'Worth of Items'),
              const SizedBox(height: 20),
              const Text('Select delivery type'),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      if(adressController.text != '' &&
                         countryController.text != '' &&
                         phoneController.text != '' &&
                         itemsController.text != '' &&
                         weightController.text != '' &&
                         worthController.text != ''){
                        final date = SendPackageModel(adress: adressController.text, country: countryController.text, phone: phoneController.text, others: othersController.text, adress2: adress2Controller.text, country2: country2Controller.text, others2: others2Controller.text, phone2: phone2Controller.text, items: itemsController.text, weight: weightController.text, worth: worthController.text);
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SendPackagePage2(date: date,))
                        );
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Not all fields are filled in"),
                                  ),
                                );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff0560fa),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff000000).withOpacity(0.15),
                            blurRadius: 5,
                            offset: const Offset(0,2), 
                          ),
                        ]
                      ),
                      child: const Column(
                        children: [
                          Icon(Icons.watch_later_outlined, color: Colors.white,),
                          SizedBox(height: 10),
                          Text('Instant delivery', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500,),),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){},
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff000000).withOpacity(0.15),
                            blurRadius: 5,
                            offset: const Offset(0,2), 
                          ),
                        ]
                      ),
                      child: const Column(
                        children: [
                          Icon(Icons.calendar_month, color: Color(0xffA7A7A7),),
                          SizedBox(height: 10),
                          Text('Scheduled delivery', style: TextStyle(color: Color(0xffA7A7A7), fontSize: 14, fontWeight: FontWeight.w500,),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}