import 'package:flutter/material.dart';
import 'package:rich/widgets/auth_btn.dart';

class FinalTransactionSucces1 extends StatefulWidget {
  const FinalTransactionSucces1({super.key});

  @override
  State<FinalTransactionSucces1> createState() => _FinalTransactionSucces1State();
}

class _FinalTransactionSucces1State extends State<FinalTransactionSucces1>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    Future.delayed( const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed('/finaltransactionsucces2');
    });
  }

  

  int countStar = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              SizedBox(
                width: 119,
                height: 119,
                child: CircularProgressIndicator(strokeCap: StrokeCap.round,strokeWidth: 10, color: const Color(0xffFF9416), backgroundColor: Colors.grey[200],)
              ),
              const SizedBox(height: 158),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Rate Rider',
                  style: TextStyle(color: Color(0xff0560FA)),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      countStar = 1;
                      setState(() {});
                    },
                    icon: countStar >= 1
                        ? const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          )
                        : const Icon(Icons.star),
                  ),
                  IconButton(
                    onPressed: () {
                      countStar = 2;
                      setState(() {});
                    },
                    icon: countStar >= 2
                        ? const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          )
                        : const Icon(Icons.star),
                  ),
                  IconButton(
                    onPressed: () {
                      countStar = 3;
                      setState(() {});
                    },
                    icon: countStar >= 3
                        ? const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          )
                        : const Icon(Icons.star),
                  ),
                  IconButton(
                    onPressed: () {
                      countStar = 4;
                      setState(() {});
                    },
                    icon: countStar >= 4
                        ? const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          )
                        : const Icon(Icons.star),
                  ),
                  IconButton(
                    onPressed: () {
                      countStar = 5;
                      setState(() {});
                    },
                    icon: countStar >= 5
                        ? const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          )
                        : const Icon(Icons.star),
                  ),
                ],
              ),
              Container(
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
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Add feedback',
                    prefixIcon: Icon(
                      Icons.messenger_rounded,
                      color: Color(0xff0560FA),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const AuthButtonWidget(content: 'Done', color: Color(0xff0560FA), textColor: Colors.white),
            ]),
          ),
        ),
      ),
    );
  }
}