import 'package:doctor_clinic/helpers/colors/colors.dart';
import 'package:doctor_clinic/helpers/size/size.dart';
import 'package:flutter/material.dart';

class DoctorDetailCard extends StatelessWidget {
  const DoctorDetailCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage(
              'assets/avatar/user.png',
            ),
            radius: 30,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Gregory House",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent.shade700,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Nephrologist",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Color(0xffD3EAFC),
                    radius: 15,
                    child: Icon(
                      Icons.cases_rounded,
                      color: Colors.blue,
                      size: 14,
                    ),
                  ),
                  Ksize.kWsize10,
                  Text(
                    "3 years",
                    style: Tstyles.greycolor,
                  ),

                  //

                  Ksize.kWsize10,
                  const CircleAvatar(
                      backgroundColor: Color(0xffFDDAD8),
                      radius: 15,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 14,
                      )),
                  Ksize.kWsize10,
                  Text(
                    "67 %",
                    style: Tstyles.greycolor,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
