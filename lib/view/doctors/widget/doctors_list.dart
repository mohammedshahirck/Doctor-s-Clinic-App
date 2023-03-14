import 'package:doctor_clinic/helpers/colors/colors.dart';
import 'package:doctor_clinic/helpers/size/size.dart';
import 'package:flutter/material.dart';

class DoctorsList extends StatelessWidget {
  const DoctorsList({
    super.key,
    required this.title,
    required this.itemcount,
  });

  final String title;
  final int itemcount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Tstyles.greendate,
          ),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  height: MediaQuery.of(context).size.height * .26,
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Ksize.ksize10,
                      Row(
                        children: [
                          Ksize.kWsize10,
                          const CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/avatar/user.png',
                            ),
                            radius: 35,
                          ),
                          Ksize.kWsize20,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Gregory House",
                                style: Tstyles.heading,
                              ),
                              Ksize.ksize10,
                              Text(
                                "Nephrologist",
                                style: Tstyles.greycolor,
                              ),
                              Ksize.ksize10,
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
                          )
                        ],
                      ),
                      Ksize.ksize20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Total fee',
                                style: Tstyles.greycolor16,
                              ),
                              Text(
                                " \$80",
                                style: Tstyles.heading,
                              )
                            ],
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // maximumSize: Size(double.infinity, 300),
                              elevation: 5,
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Make an Appointment',
                              style: Tstyles.wsubheading,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Color.fromARGB(255, 239, 231, 231),
                  thickness: 2,
                );
              },
              itemCount: itemcount),
        ],
      ),
    );
  }
}
