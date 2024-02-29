import 'package:flutter/material.dart';
import 'package:rich/widgets/auth_btn.dart';


class FinalTransactionSucces2 extends StatefulWidget {
  const FinalTransactionSucces2({super.key});

  @override
  State<FinalTransactionSucces2> createState() => _FinalTransactionSucces2State();
}

class _FinalTransactionSucces2State extends State<FinalTransactionSucces2> {
  int countStar = 0;
  final freebackController = TextEditingController();
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
              Container(
                alignment: Alignment.center,
                width: 125,
                height: 125,
                child: const AnimatedSvg(),
              ),
              const SizedBox(height: 75),
              const  Text('Delivery Successful',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),),
              Text(
                'Your Item has been delivered successfully',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 25),
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
                      color: Colors.black
                          .withOpacity(0.15),
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
              InkWell(onTap: ()=> Navigator.of(context).pushNamed('/main-page') ,child: const AuthButtonWidget(content: 'Done', color: Color(0xff0560FA), textColor: Colors.white)),
            ]),
          ),
        ),
      ),
    );
  }
}

class AnimatedSvg extends StatefulWidget {
  const AnimatedSvg({super.key});

  @override
  State<AnimatedSvg> createState() => _AnimatedSvgState();
}

class _AnimatedSvgState extends State<AnimatedSvg>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: Transform.scale(
                  scale: _isExpanded ? 0.5 : 1.1,
                  child: Image.asset(
                    'assets/send_a_package/elipse.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned.fill(
                child: Transform.scale(
                  scale: _isExpanded
                      ? 1 + _controller.value * 0.1
                      : 1 - _controller.value * 0.4,
                  child: Image.asset(
                    'assets/send_a_package/check.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}