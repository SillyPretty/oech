// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:rich/widgets/auth_btn.dart';

import '../../widgets/app_bar.dart';

class AddPayment extends StatefulWidget {
  static const routeName = '/add_payment_method';
  const AddPayment({super.key});

  @override
  State<AddPayment> createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {
  String _selectedRadio = 'Option 1';
  bool _isSubOptionsVisible = false;
  List<String> _subOptions = [];
  void _toggleSubOptions() {
    setState(() {
      _isSubOptionsVisible = !_isSubOptionsVisible;
      if (_isSubOptionsVisible) {
        _subOptions = [
          '**** **** 3323',
          '**** **** 1547'
        ]; 
      } else {
        _subOptions = []; 
      }
    });
  }

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
          text: 'Notification',
          isBack: true,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    child: RadioListTile<String>(
                      value: 'Option 1',
                      subtitle: const Text(
                        'Complete the payment using your e wallet',
                        style: TextStyle(color: Color.fromRGBO(167, 167, 167, 1)),
                      ),
                      title: const Text(
                        'Play with wallet',
                        style: TextStyle(color: Colors.black),
                      ),
                      groupValue: _selectedRadio,
                      activeColor: const Color.fromRGBO(5, 69, 250, 1),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedRadio = value!;
                        });
                      },
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 0.25), 
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 12
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset:const
                                  Offset(0, 0.25), 
                            ),
                          ],
                        ),
                        child: RadioListTile<String>(
                          title: const Text(
                            'Credit/ debet card',
                            style: TextStyle(color: Colors.black),
                          ),
                          subtitle:const Text(
                            'Complete the payment with using card',
                            style: TextStyle(
                                color: Color.fromRGBO(167, 167, 167, 1)),
                          ),
                          value: 'Option 2',
                          activeColor: const Color.fromRGBO(5, 69, 250, 1),
                          groupValue: _selectedRadio,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedRadio = value!;
              
                              _toggleSubOptions();
                            });
                          },
                        ),
                      ),
                      if (_subOptions.isNotEmpty)...{
                        for (var subOption in _subOptions)
                          RadioListTile<String>(
                            title: const Text('**** **** 3323'),
                            value: subOption,
                            groupValue: _selectedRadio,
                            activeColor: const Color.fromRGBO(5, 69, 250, 1),
                            onChanged: (String? value) {
                              setState(() {
                                _selectedRadio = value!;
                              });
                            },
                            ),
                      },
                      const SizedBox(height: 200),
                      const AuthButtonWidget(content: 'Procesed to pay', color: Color.fromRGBO(5, 69, 250, 1), textColor: Colors.white),
                      const SizedBox(height: 20),
                    ],
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