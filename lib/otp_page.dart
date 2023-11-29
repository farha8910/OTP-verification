import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  TextEditingController _otpController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    final String verificationId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Padding(
        padding:const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter OTP'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () async {
              PhoneAuthCredential credential = PhoneAuthProvider.credential(
                  verificationId: verificationId,
                  smsCode: _otpController.text);

              try{
                await FirebaseAuth.instance.signInWithCredential(credential);
                Navigator.pushReplacementNamed(context, '/home');
              }catch (e){
                print('Error:$e');
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Invalid OTP.Please try again.'),
                ));
              }
            }, child:const Text('Verify OTP')),
          ],
        ),
      ),
    );
  }
}
