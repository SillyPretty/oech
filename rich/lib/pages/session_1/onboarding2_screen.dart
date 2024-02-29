import 'package:flutter/material.dart';
import 'package:rich/widgets/auth_btn.dart';

class Onboarding2Page extends StatelessWidget {
  const Onboarding2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/onBoardingImg/onBoardingImg3.png'),
              const Text('Real-time Tracking',
              textAlign: TextAlign.center,
                style: TextStyle(
                color: Color(0xff0560FA),
                fontSize: 24,
                fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              const Text('Track your packages/items from the comfort of your home till final destination',
              textAlign: TextAlign.center,
                  style:  TextStyle(
                    fontSize: 16,
                    color: Color(0xff3A3A3A),
                  ),
                
              ),
              const SizedBox(height: 91),
              InkWell(
                onTap: () => Navigator.of(context).pushNamed('/signup'),
                child: const AuthButtonWidget(content: 'Sign Up', color: Color(0xff0560FA),textColor: Color(0xffffffff),),
              ),
              const SizedBox(height: 15),
              Wrap(children: [
                const Text('Already have an account?',
                  style: TextStyle(color: Color(0xffA7A7A7,),
                  fontSize: 14,
                ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed('/signin');
                  },
                  child: const Text(' Sign in',
                  style: TextStyle(color: Color(0xff0560FA),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
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