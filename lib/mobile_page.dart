import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MobilePage extends StatefulWidget {
  const MobilePage({super.key});

  @override
  State<MobilePage> createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage> {
  TextEditingController _mobileController = TextEditingController();
  Future<void> _verifyPhoneNumber(BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91${_mobileController.text}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
        Navigator.pushReplacementNamed(context, '/home');
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Verification Failed:${e.message}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Verification Failed:${e.message}'),
        ));
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.pushNamed(context, '/otp', arguments: verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _mobileController,
              keyboardType: TextInputType.phone,
              decoration:
                  const InputDecoration(labelText: 'Enter Mobile Number'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => _verifyPhoneNumber(context),
                child: const Text('Submit')),
          ],
        ),
      ),
    );
  }
}
