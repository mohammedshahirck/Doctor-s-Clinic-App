import 'package:doctor_clinic/helpers/size/size.dart';
import 'package:doctor_clinic/view/appointments/widget/doctors_detail_card.dart';
import 'package:doctor_clinic/view/appointments/widget/payment_options.dart';
import 'package:doctor_clinic/view/appointments/widget/promo_banner.dart';
import 'package:flutter/material.dart';

class Appoointments extends StatelessWidget {
  const Appoointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff418F9B),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 20,
          ),
        ),
        title: const Text(
          'APPOINTMENTS',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.info_outline_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(
              height: 20,
            ),
            DoctorDetailCard(),
            Ksize.ksize10,
            PromoBanner(),
            SizedBox(
              height: 10,
            ),
            PaymentOptions(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 5,
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Pay & Confirm',
            ),
          ),
        ),
      ),
    );
  }
}
