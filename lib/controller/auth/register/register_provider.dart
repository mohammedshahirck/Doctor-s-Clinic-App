// ignore_for_file: use_build_context_synchronously

import 'package:country_picker/country_picker.dart';
import 'package:doctor_clinic/services/auth/auth_service.dart';
import 'package:doctor_clinic/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  bool _isSignedIn = false;
  bool get isSingnedIn => _isSignedIn;
  bool isloading = false;

  void checkSignin() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    _isSignedIn = storage.getBool("is_signedin") ?? false;
    notifyListeners();
  }

  void checkUserState(BuildContext context) {
    AuthService().checkAuthState(context, isSingnedIn);
  }

  void sendPhoneNumber(context, FormState currentState) {
    if (currentState.validate()) {
      String phoneNumber = phoneNumberController.text.trim();
      AuthService().signInWithPhone(
          context, "+${selectedCountry.phoneCode}$phoneNumber");
      notifyListeners();
    }
  }

  TextEditingController phoneNumberController = TextEditingController();
  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "india",
    example: "india",
    displayName: "india",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );

  void changeCountry(value) {
    selectedCountry = value;
    notifyListeners();
  }

  void onchange(value) {
    phoneNumberController.text = value!;
    notifyListeners();
  }

  String? validateMobile(String? value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (value == null || value.isEmpty) {
      return 'Please enter correct Phone Number';
    } else if (value.length != 10) {
      return 'Mobile Number must be of 10 digit';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  void signOut(BuildContext context) async {
    SharedPreferences s = await SharedPreferences.getInstance();
    // isloading = true;
    notifyListeners();
    showSnackBar(
      context,
      "log out",
    );
    await SignOutService().signout(context);

    isloading = false;
    s.clear();
    notifyListeners();
  }
}
