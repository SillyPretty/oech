import 'package:flutter/material.dart';
import 'package:rich/widgets/auth_btn.dart';

class TransactionSucces2 extends StatelessWidget {
  const TransactionSucces2({super.key});

  @override
  Widget build(BuildContext context) {
    final code = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(children: [
                  const SizedBox(height: 190),
                  Container(
                    alignment: Alignment.center,
                    width: 125,
                    height: 125, 
                    child: const AnimatedSvg(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 45),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.zero,
                          child: const Text('Transation Successful',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),),
                        ),
                        const SizedBox(height: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Your rider is on the way to your destination',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Tracking Number ',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  Text(
                                    code.toString(),
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            color: const Color(0xff0560FA),),
                                  ),
                                ]),
                            const SizedBox(height: 95),
                            InkWell(onTap: (){
                              Navigator.of(context).pushNamedAndRemoveUntil(
                        '/main-page',arguments: 2,
                        (Route<dynamic> route) => false,
                      );
                              Navigator.of(context).pushNamed('/main-page', arguments: 2,);
                            }, child: const AuthButtonWidget(content: 'Track my item', color: Color(0xff0560FA), textColor: Colors.white,)),
                            const SizedBox(height: 5.7),
                            SizedBox(
                              width: double.infinity,
                              height: 46,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/main-page');
                                },
                                style: ElevatedButton.styleFrom(
                                  side: const BorderSide(
                                    color: Color(0xff0560FA), 
                                    width: 2.0,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  backgroundColor: Colors.white,
                                ),
                                child: const Text(
                                  'Go back to home page',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff0560FA),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
              )
            ],
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
              // Внешний контур
              Positioned.fill(
                child: Transform.scale(
                  scale: _isExpanded ? 0.5 : 1.1,
                  child: Image.asset(
                    'assets/send_a_package/elipse.png',
                  ),
                ),
              ),
              // Внутренний контур, анимированный
              Positioned.fill(
                child: Transform.scale(
                  scale: _isExpanded
                      ? 1 + _controller.value * 0.1
                      : 1 - _controller.value * 0.4,
                  child: Image.asset(
                    'assets/send_a_package/check.png',
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