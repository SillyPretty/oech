import 'package:flutter/material.dart';
import 'package:rich/widgets/auth_btn.dart';

import '../../widgets/text_field_password_widget.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  bool checkedValue = false;
  final pass = TextEditingController();
  final confirmPass = TextEditingController();
  var buttonColor = const Color(0xffA7A7A7);
  @override
  void initState() {
    super.initState();
    pass.addListener(() {
      if (confirmPass.text != '' && pass.text != '') {
        if (confirmPass.text == pass.text) {
          buttonColor = const Color(0xff0560FA);
        }
      } else {
        buttonColor = const Color(0xffA7A7A7);
      }
      setState(() {});
    });
    confirmPass.addListener(() {
      if (confirmPass.text != '' && pass.text != '') {
        if (confirmPass.text == pass.text) {
          buttonColor = const Color(0xff0560FA);
        }
      } else {
        buttonColor = const Color(0xffA7A7A7);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 24, top: 170, right: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'New Password',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromRGBO(58, 58, 58, 1),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text('Enter new password',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(167, 167, 167, 1))),
              const SizedBox(height: 56),
              Container(
                padding: EdgeInsets.zero,
                width: double.infinity,
                child: TextFieldPasswordWidget(
                  controller: pass,
                  textTitle: 'Password',
                  hintText: '**********',
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: EdgeInsets.zero,
                width: double.infinity,
                child: TextFieldPasswordWidget(
                  controller: confirmPass,
                  textTitle: 'Confirm Password',
                  hintText: '**********',
                ),
              ),
              const SizedBox(height: 56),
              InkWell(
                onTap: () {
                  if (buttonColor == const Color(0xff0560FA)) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/main-page',
                      (Route<dynamic> route) => false,
                    );
                  }
                },
                child: AuthButtonWidget(
                  content: 'Log in',
                  color: buttonColor,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}