// ignore_for_file: use_build_context_synchronously

import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:rich/pages/session_2/otp_screen.dart';
import 'package:rich/widgets/auth_btn.dart';

import '../../widgets/text_field_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

bool buttonPressed = false;

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final controllerEmail = TextEditingController();
  var buttonColor = const Color(0xffA7A7A7);
  @override
  void initState() {
    super.initState();
    controllerEmail.addListener(() {
      if (controllerEmail.text != '') {
        buttonColor = const Color(0xff0560FA);
      } else {
        buttonColor = const Color(0xffA7A7A7);
      }
      setState(() {});
    });
  }


  @override
  void dispose() {
    controllerEmail.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    EmailOTP myauth = EmailOTP();
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 24, top: 170, right: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Forgot Password',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    color: Color.fromRGBO(58, 58, 58, 1),
                    fontWeight: FontWeight.w500,
                  )),
              const Text(
                'Enter your email address',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(167, 167, 167, 1),
                ),
              ),
              const SizedBox(height: 56),
              Container(
                padding: EdgeInsets.zero,
                child: TextFieldWidget(
                  controller: controllerEmail,
                  textTitle: 'Email Address',
                  hintText: '***********@mail.com',
                ),
              ),
              const SizedBox(height: 56),
              Column(
                children: [
                  SizedBox(
                    width: 380,
                    child: buttonPressed == false
                        ? InkWell(
                          child: AuthButtonWidget(content: 'Send OTP', color: buttonColor, textColor: Colors.white),
                            onTap: () async {
                              if(buttonColor != const Color.fromRGBO(167, 167, 167, 1)){
                               buttonPressed = true;
                              setState(() {});
                              myauth.setConfig(
                                  appEmail: "contact@hdevcoder.com",
                                  appName: "Email OTP",
                                  userEmail: controllerEmail.text,
                                  otpLength: 6,
                                  otpType: OTPType.digitsOnly);
                              if (await myauth.sendOTP() == true) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("OTP has been sent"),
                                ));
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OtpScreen(
                                      email: controllerEmail.text,
                                      respOtp: myauth,
                                    ),
                                  ),
                                );
                              }else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Oops, OTP send failed"),
                                  ),
                                );
                              }
                              }
                              else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Write your Email"),
                                  ),
                                );
                              }
                            }
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                              color: Color(0xff0560FA),
                            ),
                          ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 55),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Remember password? Back to ',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(167, 167, 167, 1)),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign in',
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(5, 96, 250, 1)),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, '/signin');
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}