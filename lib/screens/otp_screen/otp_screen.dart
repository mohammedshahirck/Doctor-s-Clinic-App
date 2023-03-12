import 'package:doctor_clinic/helpers/colors/colors.dart';
import 'package:doctor_clinic/helpers/size/size.dart';
import 'package:doctor_clinic/widgets/background_gradiant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
    required this.verificationId,
  });
  final String verificationId;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: BackgroundGradiant(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
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
                  OtpTextField(
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
                    // clearText: values.clear,
                    // onSubmit: (String code) => values.setCode(code),
                  ),
                  Ksize.ksize70,
                  Ksize.kWsize30,
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .06,
                    child: ElevatedButton.icon(
                      onPressed: () {},
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
      ),
    );
  }

  // @override
  // void dispose() {
  //   OtpController().timer?.cancel();
  //   super.dispose();
  // }
}
