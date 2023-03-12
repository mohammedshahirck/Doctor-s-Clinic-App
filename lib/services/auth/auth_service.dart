import 'dart:developer';

import 'package:doctor_clinic/screens/otp_screen/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          await firebaseAuth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) {
          throw Exception(error.message);
        },
        codeSent: (verificationId, forceResendingToken) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return OtpScreen(verificationId: verificationId);
            },
          ));
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
