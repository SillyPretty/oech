import 'package:flutter/material.dart';
import 'package:rich/widgets/auth_btn.dart';
import 'package:rich/widgets/text_field_password_widget.dart';
import 'package:rich/widgets/text_field_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}



class _SignInPageState extends State<SignInPage> {


  var buttonColor = const Color.fromRGBO(167, 167, 167, 1);
  @override
  void initState() {
    super.initState();
    loginController.addListener(() {
      if (loginController.text != '' && passwordController.text != '') {
        buttonColor = const Color.fromARGB(255, 5, 96, 250);
      } else {
        buttonColor = const Color.fromRGBO(167, 167, 167, 1);
      }
      setState(() {});
    });
    passwordController.addListener(() {
      if (loginController.text != '' && passwordController.text != '') {
        buttonColor = const Color.fromARGB(255, 5, 96, 250);
      } else {
        buttonColor = const Color.fromRGBO(167, 167, 167, 1);
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    passwordController.removeListener(() {});
    loginController.removeListener(() {});
    super.dispose();
  }

  bool checkedValue = false;
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const SizedBox(height: 50),
            const Text('Welcome Back', 
            style: TextStyle(color: Color(0xff3A3A3A),
            fontSize: 24,
            fontWeight: FontWeight.w500,
            ),
            ),
            const SizedBox(height: 10),
            const Text('Fill in your email and password to continue',
              style: TextStyle(color: Color(0xffA7A7A7),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            TextFieldWidget(controller: loginController, textTitle: 'Email Address', hintText: '***********@mail.com'),
            const SizedBox(height: 15),
            TextFieldPasswordWidget(controller: passwordController, textTitle: 'Password', hintText: '**********'),
            Row(children: [
              Checkbox(
                activeColor: const Color.fromARGB(255, 5, 96, 250),
                value: checkedValue,
                onChanged: (newValue) {
                  setState(
                    () {
                      checkedValue = newValue!;
                    },
                  );
                },
              ),
              const Text('Remember password',style: TextStyle(color: Color(0xffA7A7A7),fontSize: 12,fontWeight: FontWeight.w500),),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/forgot');
                },
                child: const Text('Forgot Password?',style: TextStyle(color: Color(0xff0560FA),fontSize: 12,fontWeight: FontWeight.w500),),
              ),
            ],),
            const SizedBox(height: 180),
            InkWell(onTap: () {
              if (buttonColor == const Color.fromARGB(255, 5, 96, 250)) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        '/main-page',
                        (Route<dynamic> route) => false,
                      );
                    }
            },
              child: AuthButtonWidget(content: 'Log in', color: buttonColor, textColor: const Color(0xffffffff),
              ),
            ),
            const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.center,
                    child: Wrap(children: [
                      const Text('Already have an account?',
                        style: TextStyle(color: Color(0xffA7A7A7,),
                        fontSize: 14,
                      ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushNamed('/signup');
                        },
                        child: const Text(' Sign Up',
                        style: TextStyle(color: Color(0xff0560FA),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Center(
                  child: Text('or log in using',
                    style: TextStyle(color: Color(0xffa7a7a7),
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Center(child: Image.asset('assets/icons/google_icon.png')),
          ],),
        ),
      ),
    ),
    );
  }
}