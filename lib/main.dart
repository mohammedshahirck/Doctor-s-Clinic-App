import 'package:doctor_clinic/provider/register_provider.dart';
import 'package:doctor_clinic/screens/onbord/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RegisterProvider(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        home: const WelcomeScreen(),
        title: "Doctor Clinic",
      ),
    );
  }
}
