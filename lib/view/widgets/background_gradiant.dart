import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BackgroundGradiant extends StatelessWidget {
  final Widget child;

  const BackgroundGradiant({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Center(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  // stops: [0.1, 0.4, 0.6, 0.9],
                  colors: <Color>[
                    Color(0x66418F9B),
                    Color(0x99418F9B),
                    Color(0xcc418F9B),
                    Color(0xff418F9B),
                  ],
                ),
              ),
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
