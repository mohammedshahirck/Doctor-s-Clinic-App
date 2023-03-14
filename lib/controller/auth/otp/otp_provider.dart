import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_clinic/controller/user_provider/user_provider.dart';
import 'package:doctor_clinic/utils/exception.dart';

import 'package:doctor_clinic/view/user_details_get/user_details.dart';
import 'package:doctor_clinic/utils/utils.dart';
import 'package:doctor_clinic/view/widgets/bottom_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpProvider extends ChangeNotifier {
  bool isLoading = false;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String? _uid;
  String get uid => _uid!;

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;
  String? otpCode;

  final provider = UserProvider();

  Future<bool> checkExistingUser() async {
    DocumentSnapshot snapshot =
        await firebaseFirestore.collection("users").doc(_uid).get();
    if (snapshot.exists) {
      return true;
    } else {
      return false;
    }
  }

  void onsubmit(String code) {
    otpCode = code;
    notifyListeners();
  }

  void verifiyOtp({
    required BuildContext context,
    required String verificationId,
    required String userOtp,
    required Function onSuccess,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOtp);
      User? user = (await firebaseAuth.signInWithCredential(credential)).user;
      if (user != null) {
        _uid = user.uid;
        onSuccess();
      }
      isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      Exceptionsfires.errorHandler(e, context);
    }
  }

  Future setSignIn() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.setBool("is_signedin", true);
    _isSignedIn = true;
    notifyListeners();
  }

  void otpVerification(
      BuildContext context, String userOtp, String verificationId) {
    verifiyOtp(
      context: context,
      verificationId: verificationId,
      userOtp: userOtp,
      onSuccess: () {
        checkExistingUser().then(
          (value) async {
            log(value.toString());
            if (value == true) {
              provider.getDatafromFirestore().then(
                    (value) => provider.saveUserDataToSP().then(
                          (value) => setSignIn().then(
                            (value) => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const BottomNav(),
                                ),
                                (route) => false),
                          ),
                        ),
                  );
            } else {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserInfromationScreen()),
                  (route) => false);
            }
          },
        );
      },
    );
  }
}
