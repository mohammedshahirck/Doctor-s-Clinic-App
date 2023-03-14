import 'package:doctor_clinic/helpers/colors/colors.dart';
import 'package:doctor_clinic/helpers/size/size.dart';

import 'package:doctor_clinic/utils/utils.dart';
import 'package:doctor_clinic/view/widgets/background_gradiant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';

import '../../controller/auth/otp/otp_provider.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({
    super.key,
    required this.verificationId,
  });
  final String verificationId;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OtpProvider>(context, listen: true);
    final isloading = provider.isLoading;
    return Scaffold(
      body: SafeArea(
        child: BackgroundGradiant(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: isloading == true
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.purple,
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Ksize.ksize100,
                      Ksize.ksize80,
                      Text("Enter 6 digit verification code sent to you number",
                          style: Tstyles.wheading),
                      const SizedBox(
                        height: 50,
                      ),
                      Consumer<OtpProvider>(builder: (context, otp, _) {
                        return OtpTextField(
                            onCodeChanged: (value) {
                              otp.onsubmit(value);
                            },
                            numberOfFields: 6,
                            showFieldAsBox: true,
                            filled: true,
                            fillColor: Kcolors.bgcolor,
                            fieldWidth: 50,
                            borderRadius: BorderRadius.circular(15),
                            autoFocus: true,
                            borderWidth: 2,
                            enabledBorderColor: const Color(0xff335546),
                            disabledBorderColor: const Color(0xff335546),
                            focusedBorderColor:
                                const Color.fromARGB(255, 235, 253, 245),
                            onSubmit: (String code) => otp.onsubmit(code));
                      }),
                      Ksize.ksize70,
                      Ksize.kWsize30,
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .06,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            if (provider.otpCode != null) {
                              provider.otpVerification(
                                  context, provider.otpCode!, verificationId);
                            } else {
                              showSnackBar(context, "Enter 6-Digit code");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Kcolors.bgcolor,
                            shape: const StadiumBorder(),
                          ),
                          icon: Container(),
                          label: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Confirm',
                                  style: Tstyles.heading,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(.4),
                                      shape: BoxShape.circle),
                                  height: 40,
                                  width: 40,
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
