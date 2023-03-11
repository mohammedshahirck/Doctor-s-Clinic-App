import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
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
    notifyListeners();
    selectedCountry = value;
  }
}
