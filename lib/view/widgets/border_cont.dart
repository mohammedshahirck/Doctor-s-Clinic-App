import 'package:doctor_clinic/helpers/colors/colors.dart';
import 'package:doctor_clinic/helpers/size/size.dart';
import 'package:flutter/material.dart';

class BorderContainer extends StatelessWidget {
  const BorderContainer(
      {super.key,
      required this.child,
      required this.width,
      required this.color,
      this.boxShadow,
      required this.text});
  final Widget child;
  final double width;
  final Color color;
  final String text;

  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              boxShadow: boxShadow,
              shape: BoxShape.circle,
              border: Border.all(color: color, width: width),
            ),
            child: child),
        Ksize.ksize10,
        Text(
          text,
          style: Tstyles.greycolor,
        )
      ],
    );
  }
}
