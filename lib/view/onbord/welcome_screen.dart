import 'package:doctor_clinic/controller/auth/register/register_provider.dart';
import 'package:doctor_clinic/helpers/colors/colors.dart';
import 'package:doctor_clinic/helpers/size/size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegisterProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                  child: Column(
                children: [
                  Ksize.ksize80,
                  Text(
                    ' Welcome To Your',
                    style: Tstyles.heading,
                  ),
                  Text(
                    'Healthcare Assistent',
                    style: Tstyles.heading,
                  ),
                  Ksize.ksize80,
                  Ksize.ksize60,
                  InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      provider.checkUserState(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xff418F9B),
                      ),
                      width: MediaQuery.of(context).size.width * .25,
                      height: MediaQuery.of(context).size.height * .05,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Start',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: 18,
                              weight: 30,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
              Ksize.ksize100,
              Ksize.ksize50,
              Container(
                height: MediaQuery.of(context).size.height * .45,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          'assets/images/doctor_team.png',
                        ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
