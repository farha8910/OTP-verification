import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:otp/Home_page.dart';
import 'package:otp/mobile_page.dart';
import 'package:otp/otp_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBfa3fF6h4vb4XE7y5q_2ZXCEhWStyvuLA",
        appId: "1:650605328592:android:4324b7508545a001e2c6d5",
        messagingSenderId: "650605328592",
        projectId: "otp-58965"));
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Phone Authentication',
      initialRoute: '/',
      routes: {
        '/':(context)=>MobilePage(),
        '/otp':(context)=>OTPPage(),
        '/home':(context)=>HomePage(),
      },
    );
  }
}
