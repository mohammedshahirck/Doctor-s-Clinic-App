import 'package:country_picker/country_picker.dart';
import 'package:doctor_clinic/helpers/colors/colors.dart';
import 'package:doctor_clinic/helpers/size/size.dart';
import 'package:doctor_clinic/provider/register_provider.dart';
import 'package:doctor_clinic/widgets/background_gradiant.dart';
import 'package:doctor_clinic/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegisterProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
          child: BackgroundGradiant(
              child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Ksize.ksize200,
            Text(
              'Register',
              style: Tstyles.wheading,
            ),
            Ksize.ksize20,
            Text(
              "Add your phone number.we'll send you a verification code",
              style: Tstyles.wsubheading,
              textAlign: TextAlign.center,
            ),
            Ksize.ksize20,
            CustomTextField(
                prefixicon: Consumer<RegisterProvider>(
                    builder: (context, values, child) {
                  return Container(
                    padding: const EdgeInsets.all(13),
                    child: InkWell(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          countryListTheme: const CountryListThemeData(
                              bottomSheetHeight: 550),
                          onSelect: (value) {
                            values.changeCountry(value);
                          },
                        );
                      },
                      child: Text(
                        "${provider.selectedCountry.flagEmoji}  +${provider.selectedCountry.phoneCode}",
                        style: Tstyles.heading,
                      ),
                    ),
                  );
                }),
                hintText: "Enter phone number ",
                tiaction: TextInputAction.done,
                keyboardType: TextInputType.phone)
          ],
        ),
      ))),
    );
  }
}
