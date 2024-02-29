import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class TransactionSucces1 extends StatefulWidget {
  const TransactionSucces1({super.key});

  @override
  State<TransactionSucces1> createState() => _TransactionSucces1State();
}

class _TransactionSucces1State extends State<TransactionSucces1>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
    Timer(const Duration(seconds: 2),() {
      final args = ModalRoute.of(context)?.settings.arguments;
      Navigator.of(context).pushReplacementNamed('/success2', arguments: args);
    }
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final code = ModalRoute.of(context)?.settings.arguments;
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 119,
              height: 119,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _controller.value * 2 * pi,
                    child: CircularProgressIndicator(
                      strokeWidth: 10,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.orange,
                      ),
                      backgroundColor: Colors.grey[200],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 100),
            Text(
                'Your rider is on the way to your destination',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 5),
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
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: const Color(0xff0560FA),),
                ),
              ],
            ),
            const SizedBox(height: 70),
            SizedBox(
              width: 342,
              height: 50,
              child: TextButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(
                    color: Color(0xff0560FA),
                    width: 2.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  backgroundColor: const Color(0xff0560FA),
                ),
                child: const Text(
                  'Track my item',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 342,
              height: 50,
              child: TextButton(
                onPressed: () {
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
      ),
    );
  }
}