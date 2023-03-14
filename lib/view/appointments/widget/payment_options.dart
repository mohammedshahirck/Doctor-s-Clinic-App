import 'package:flutter/material.dart';

class PaymentOptions extends StatelessWidget {
  const PaymentOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "PAYMENT OPTIONS",
                style: TextStyle(
                  color: Colors.deepPurple[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.teal,
                  radius: 6,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 3,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'PayPal',
                  style: TextStyle(
                    color: Colors.deepPurple[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.grey),
                right: BorderSide(color: Colors.grey),
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 6,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 3,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Credit Card',
                  style: TextStyle(
                    color: Colors.deepPurple[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
