import 'package:doctor_clinic/helpers/colors/colors.dart';
import 'package:doctor_clinic/helpers/size/size.dart';
import 'package:doctor_clinic/view/doctors/widget/doctors_list.dart';
import 'package:flutter/material.dart';

class DoctorsPage extends StatelessWidget {
  const DoctorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kcolors.bgcolor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        elevation: 0,
        backgroundColor: const Color(0xff418F9B),
        title: Text(
          'DOCTORS',
          style: Tstyles.wsubheading,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.info_outline,
                color: Colors.white,
              ))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: 180,
                color: const Color(0xff418F9B),
                child: Column(
                  children: [
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
                  ],
                ),
              ),
              Ksize.ksize20,
              const DoctorsList(
                title: 'DOCTORS NEARBY',
                itemcount: 1,
              ),
              Ksize.ksize20,
              const DoctorsList(title: "RECOMMENDED", itemcount: 5)
            ],
          ),
        ),
      ),
    );
  }
}
