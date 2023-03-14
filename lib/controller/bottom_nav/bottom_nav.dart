import 'package:doctor_clinic/view/appointments/appointments.dart';
import 'package:doctor_clinic/view/doctors/doctors_page.dart';
import 'package:doctor_clinic/view/home_screen/home_screen.dart';
import 'package:doctor_clinic/view/settings/settings_screen.dart';

import 'package:flutter/material.dart';

class BottomNavProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changePage(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  List<Widget> pages = [
    const HomePage(),
    const DoctorsPage(),
    const Appoointments(),
    const Settings(),
  ];
}
