import 'package:doctor_clinic/helpers/colors/colors.dart';
import 'package:doctor_clinic/helpers/size/size.dart';
import 'package:flutter/material.dart';

class ReportDetailList extends StatelessWidget {
  const ReportDetailList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Ksize.ksize10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'DAILY REPORTS',
                style: Tstyles.heading,
              ),
              Image.asset(
                'assets/dot.png',
                height: 15,
              )
            ],
          ),
          Ksize.ksize20,
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                height: 120,
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Symtoms of Covid to watch \nout for",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              Ksize.ksize10,
                              Text(
                                "March 06.09.09:01",
                                style: Tstyles.greycolor16,
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/images/vaccine.jpg',
                                  ))),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Ksize.ksize20;
            },
          ),
        ],
      ),
    );
  }
}
