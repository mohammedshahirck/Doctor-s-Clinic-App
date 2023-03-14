import 'package:doctor_clinic/controller/bottom_nav/bottom_nav.dart';
import 'package:doctor_clinic/view/widgets/bottom_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavProvider>(context);
    final currentIndex = provider.currentIndex;
    final BottoomItem item = BottoomItem();

    return Consumer<BottomNavProvider>(builder: (context, bottombar, _) {
      return Scaffold(
        body: bottombar.pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
            elevation: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: currentIndex,
            selectedIconTheme: const IconThemeData(color: Colors.amber),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            backgroundColor: Colors.white54,
            iconSize: 28,
            onTap: (value) => bottombar.changePage(value),
            items: [
              item.bottomItem(currentIndex, 0, Icons.home),
              item.bottomItem(currentIndex, 1, Icons.text_snippet),
              item.bottomItem(currentIndex, 2, Icons.calendar_month_outlined),
              item.bottomItem(currentIndex, 3, Icons.settings),
            ]),
      );
    });
  }
}
