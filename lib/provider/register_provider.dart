import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  bool isloading = false;
  final formKey = GlobalKey<FormState>();
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

  String? validateMobile(String value) {
    if (value.length != 10) {
      return 'Mobile Number must be of 10 digit';
    } else {
      return null;
    }
  }
}
