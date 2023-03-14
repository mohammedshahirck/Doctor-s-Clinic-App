import 'package:doctor_clinic/helpers/colors/colors.dart';
import 'package:doctor_clinic/helpers/size/size.dart';
import 'package:doctor_clinic/view/widgets/border_cont.dart';
import 'package:flutter/material.dart';

class ServicesCard extends StatelessWidget {
  const ServicesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .2,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "SERVICES",
                  style: Tstyles.greendate,
                ),
                const Text(
                  "Sea all",
                  style: TextStyle(
                      color: Colors.amber, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Ksize.ksize10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // List.generate(4, (index) => null)
                Ksize.ksize20,
                BorderContainer(
                    width: 10,
                    color: const Color(0xffDCECEC),
                    text: "Covid-19",
                    child: CircleAvatar(
                      backgroundColor: const Color(0xff87B9C0),
                      radius: 32,
                      child: Image.asset(
                        "assets/images/105468-covid-19-png-image-high-quality.png",
                        height: 35,
                        width: 35,
                      ),
                    )),
                BorderContainer(
                    width: 10,
                    color: const Color(0xffDCECEC),
                    text: 'Doctors',
                    child: CircleAvatar(
                        backgroundColor: const Color(0xff87B9C0),
                        radius: 32,
                        child: Image.asset(
                          'assets/images/images.png',
                          height: 35,
                          width: 35,
                        ))),
                const BorderContainer(
                    width: 10,
                    color: Color(0xffDCECEC),
                    text: 'Hospitals',
                    child: CircleAvatar(
                        backgroundColor: Color(0xff87B9C0),
                        radius: 32,
                        child: Text("+",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.w900)))),
                const BorderContainer(
                    width: 10,
                    color: Color(0xffDCECEC),
                    text: 'Medicines',
                    child: CircleAvatar(
                        backgroundColor: Color(0xff87B9C0),
                        radius: 32,
                        child: Icon(
                          Icons.medication_sharp,
                          size: 40,
                          color: Colors.black,
                        ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
