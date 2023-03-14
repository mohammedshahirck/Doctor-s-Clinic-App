import 'dart:developer';
import 'package:doctor_clinic/controller/user_provider/user_provider.dart';
import 'package:doctor_clinic/helpers/colors/colors.dart';
import 'package:doctor_clinic/helpers/size/size.dart';
import 'package:doctor_clinic/view/home_screen/widget/date_slider.dart';
import 'package:doctor_clinic/view/home_screen/widget/report_detail_list.dart';
import 'package:doctor_clinic/view/home_screen/widget/services_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Kcolors.bgcolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(
          0xff418F9B,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Ksize.ksize5,
                Text(
                  '👋 Hello,',
                  style: Tstyles.wsubheading,
                ),
                Text(
                  "Gregory House",
                  style: Tstyles.wsubheading,
                )
              ],
            ),
            user.userModel?.profilePic != null
                ? CircleAvatar(
                    backgroundColor: Colors.black12,
                    backgroundImage:
                        NetworkImage("${user.userModel?.profilePic}"),
                    radius: 22,
                  )
                : const CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 22,
                  )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              Container(
                  height: 250,
                  color: const Color(
                    0xff418F9B,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(children: [
                        Ksize.ksize20,
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Search',
                                border: InputBorder.none,
                                icon: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Image.asset(
                                    'assets/54481.png',
                                    height: 20,
                                    width: 20,
                                  ),
                                )),
                          ),
                        ),
                        Ksize.ksize30,
                        const DateSlider(itemcount: (7 * 4) + 3),
                      ]))),
              Ksize.ksize10,
              const ServicesCard(),
              Ksize.ksize10,
              const ReportDetailList(),
            ],
          ),
        ),
      ),
    );
  }
}
