import 'package:doctor_clinic/constants/constants.dart';
import 'package:doctor_clinic/helpers/colors/colors.dart';
import 'package:doctor_clinic/helpers/size/size.dart';
import 'package:flutter/material.dart';

class DateSlider extends StatelessWidget {
  const DateSlider({
    super.key,
    required this.itemcount,
  });
  final int itemcount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return index == 0
                ? const SizedBox()
                : index % 3 == 0 || index % 28 == 0
                    ? Column(
                        children: [
                          Text(
                            Constants().days[index],
                            style: Tstyles.datecolors,
                          ),
                          Ksize.ksize10,
                          Card(
                            elevation: 4,
                            shape: const CircleBorder(),
                            child: Container(
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffFFFFFF)),
                              height: 34,
                              width: 34,
                              child: Center(
                                  child: Text(
                                index.toString(),
                                style: Tstyles.greendate,
                              )),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Text(
                            Constants().days[index],
                            style: Tstyles.datecolors,
                          ),
                          Ksize.ksize10,
                          Card(
                            elevation: 4,
                            shape: const CircleBorder(),
                            child: Container(
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff4C9AA6)),
                              height: 34,
                              width: 34,
                              child: Center(
                                  child: Text(
                                index.toString(),
                                style: Tstyles.datecolors,
                              )),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '.',
                                style: Tstyles.wheading,
                              ),
                              Text(
                                '.',
                                style: Tstyles.wheading,
                              )
                            ],
                          )
                        ],
                      );
          },
          separatorBuilder: (context, index) {
            return Ksize.kWsize10;
          },
          itemCount: itemcount),
    );
  }
}
