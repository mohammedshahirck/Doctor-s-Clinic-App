import 'package:doctor_clinic/helpers/colors/colors.dart';
import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          ListTile(
            title: Text("Total Cost", style: Tstyles.heading),
            subtitle: const Text(
              'Session fee for 30 minutes',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            trailing: Text('\$80', style: Tstyles.heading),
          ),
          ListTile(
            title: Text("To Pay", style: Tstyles.heading),
            trailing: Text('\$80', style: Tstyles.heading),
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/images/promos.png',
                      height: 30,
                      width: 30,
                      color: Color(0xff418F9B),
                    ),
                    const Spacer(),
                    Text("Use Promo Code", style: Tstyles.heading),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
