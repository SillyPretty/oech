import 'package:flutter/material.dart';
import 'package:rich/widgets/text_field_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/auth_btn.dart';
import '../../widgets/text_field_password_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var buttonColor = const Color.fromRGBO(167, 167, 167, 1);
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    confirmPasswordController.addListener(() {
      if (confirmPasswordController.text != '' &&
          emailController.text != '' &&
          nameController.text != '' &&
          phoneController.text != '' &&
          passwordController.text != '' &&
          checkedValue != false) {
        if (passwordController.text == confirmPasswordController.text) {
          buttonColor = const Color.fromARGB(255, 5, 96, 250);
        }
        else{
          buttonColor = const Color.fromRGBO(167, 167, 167, 1);
        }
      } else {
        buttonColor = const Color.fromRGBO(167, 167, 167, 1);
      }
      
      setState(() {});
    });
  }

  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const Text('Create an account', 
                  style: TextStyle(color: Color(0xff3a3a3a),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text('Complete the sign up process to get started',
                  style: TextStyle(color: Color(0xffa7a7a7),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 33),
                TextFieldWidget(controller: nameController, textTitle: 'Full name', hintText: 'Ivanov Ivan'),
                const SizedBox(height: 10),
                TextFieldWidget(controller: phoneController, textTitle: 'Phone Number', hintText: '+7(999)999-99-99', inputType: TextInputType.phone,),
                const SizedBox(height: 10),
                TextFieldWidget(controller: emailController, textTitle: 'Email Address', hintText: '***********@mail.com', inputType: TextInputType.emailAddress,),
                const SizedBox(height: 10),
                TextFieldPasswordWidget(controller: passwordController, textTitle: 'Password', hintText: '**********'),
                const SizedBox(height: 10),
                TextFieldPasswordWidget(controller: confirmPasswordController, textTitle: 'Confirm Password', hintText: '**********'),
                Container(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            child: Checkbox(
                              activeColor: const Color.fromARGB(255, 5, 96, 250),
                              value: checkedValue,
                              onChanged: (newValue) {
                                    checkedValue = newValue!;
                                    if (confirmPasswordController.text != '' &&
                                        emailController.text != '' &&
                                        nameController.text != '' &&
                                        phoneController.text != '' &&
                                        passwordController.text != '' &&
                                        checkedValue != false) {
                                      if (passwordController.text == confirmPasswordController.text) {
                                        buttonColor = const Color.fromARGB(255, 5, 96, 250);
                                      }
                                      else{
                                        buttonColor = const Color.fromRGBO(167, 167, 167, 1);
                                      }
                                    } else {
                                      buttonColor = const Color.fromRGBO(167, 167, 167, 1);
                                    }
                                    setState(() {});
                              },
                            ),
                          ),      
                          SizedBox(
                            width: 290,
                            child: Wrap(
                              children: [
                                const Text(
                                  'By ticking this box, you agree to our ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(167, 167, 167, 1),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    await launchUrl(
                                      Uri.parse(
                                          'https://policies.google.com/privacy?hl=ruv'),
                                    );
                                  },
                                  child: const Text(
                                    'Terms and conditions and private policy',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(235, 188, 46, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    InkWell(
                      onTap: (){
                        if (buttonColor == const Color.fromARGB(255, 5, 96, 250)) {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                '/main-page',
                                (Route<dynamic> route) => false,
                              );
                            }
                      },
                      child: AuthButtonWidget(content: 'Sign Up', color: buttonColor, textColor: const Color(0xffffffff),),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}