import 'package:doctor_clinic/controller/user_provider/user_provider.dart';
import 'package:doctor_clinic/view/otp_screen/otp_screen.dart';
import 'package:doctor_clinic/utils/utils.dart';
import 'package:doctor_clinic/view/register_screen/register_screen.dart';
import 'package:doctor_clinic/view/widgets/bottom_nav.dart';
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
          // throw Exception(error.message);
          showSnackBar(context, error.toString());
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
      showSnackBar(context, e.toString());
    }
  }

  Future<void> checkAuthState(context, bool issignIn) async {
    if (firebaseAuth.currentUser != null || issignIn == true) {
      await UserProvider().getDataFromFS().whenComplete(
          () => Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return const BottomNav();
                },
              )));
    } else {
      await Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return const RegisterScreen();
        },
      ));
    }
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class SignOutService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> signout(context) async {
    try {
      await firebaseAuth.signOut();
      showSnackBar(context, "Signed out");

      await Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return const RegisterScreen();
        },
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == "network-request-failed") {
        showSnackBar(context, e.toString());
      }
    } on FirebaseException catch (e) {
      if (e.code == "too-many-requests") {
        showSnackBar(context, "Please try again after some time");
      } else {
        showSnackBar(context, e.message!);
      }
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }
}
