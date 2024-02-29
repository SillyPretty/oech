import 'package:flutter/material.dart';
import 'package:rich/pages/session_1/onboarding1_screen.dart';
import 'package:rich/pages/session_1/onboarding2_screen.dart';
import 'package:rich/pages/session_1/splash_screen.dart';
import 'package:rich/pages/session_2/forgot_password_screen.dart';
import 'package:rich/pages/session_2/new_password_screen.dart';
import 'package:rich/pages/session_2/sign_in_screen.dart';
import 'package:rich/pages/session_2/sign_up_screen.dart';
import 'package:rich/pages/session_3/notification.dart';
import 'package:rich/pages/session_3/send_package_screen.dart';
import 'package:rich/pages/session_3/transaction_success_2.dart';
import 'package:rich/pages/session_4/add_payment.dart';
import 'package:rich/pages/session_4/final_tracsation_success.dart';
import 'package:rich/pages/session_4/final_tracsation_success2.dart';
import 'package:rich/pages/session_5/chats_page.dart';
import 'package:rich/pages/session_5/home_page.dart';

import 'pages/session_3/main_screen.dart';
import 'pages/session_3/transaction_success_1.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Redi',
      initialRoute: '/',
        routes: {
          //session 1
          '/' :(context) => const SpalshScreenWidget(),
          '/onboarding1' :(context) =>  const Onboarding1Page(),
          '/onboarding2' :(context) =>  const Onboarding2Page(),
          //session 2
          '/signup' : (context) => const SignUpPage(),
          '/signin' : (context) => const SignInPage(),
          '/forgot' : (context) => const ForgotPasswordPage(),
          '/newpass' : (context) => const NewPasswordPage(),
          //session 3
          '/main-page': (context) => const MainPage(),
          '/notification' : (context) => const NotificationPage(),
          '/send-package' :(context) => const SendPackagePage(),
          '/transactionsucces1' :(context) => const TransactionSucces1(),
          '/success2' :(context) => const TransactionSucces2(),
          //session 4
          '/addpayment' :(context) =>  const AddPayment(),
          '/finaltransactionsucces1' : (context) => const FinalTransactionSucces1(),
          '/finaltransactionsucces2' : (context) => const FinalTransactionSucces2(),
          //session 5
          '/home-page': (context) => const HomePage(),
          '/chats-page': (context) => const ChatsPage(),
        },
      );
  }
}