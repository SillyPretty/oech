import 'package:flutter/material.dart';
import 'package:rich/model/on_boarding_model.dart';

class Onboarding1Page extends StatefulWidget {
  const Onboarding1Page({super.key});

  @override
  State<Onboarding1Page> createState() => _Onboarding1PageState();
}

List<OnBoardingListType> list = [OnBoardingListType(img: 'assets/onBoardingImg/onBoardingImg1.png', h1: 'Quick Delivery At Your Doorstep', subtitle: 'Enjoy quick pick-up and delivery to your destination'),
OnBoardingListType(img: 'assets/onBoardingImg/onBoardingImg2.png', h1: 'Flexible Payment', subtitle: 'Different modes of payment either before and after delivery without stress',)];
int index = 0;

class _Onboarding1PageState extends State<Onboarding1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 346,
                height: 346,
                child: Image.asset(list[index].img),
              ),
              const SizedBox(height: 20),
              Text(list[index].h1,
              textAlign: TextAlign.center,
                style: const TextStyle(
                color: Color(0xff0560FA),
                fontSize: 24,
                fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 271,
                child: Text(list[index].subtitle,
                textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xff3A3A3A),
                  ),
                ),
              ),
              const SizedBox(height: 49),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/onboarding2');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xff0560FA),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10))
                    ),
                    child:const Text('Skip', 
                    style: TextStyle(
                      color: Color(0xff0560FA),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if(index >= 1) {
                      Navigator.of(context).pushReplacementNamed('/onboarding2');
                    }
                    else{
                      index += 1;
                    setState(() {});
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: const BoxDecoration(
                      color: Color(0xff0560FA),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child:const Text('Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),),
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