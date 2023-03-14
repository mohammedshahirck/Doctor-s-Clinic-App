import 'package:doctor_clinic/controller/auth/otp/otp_provider.dart';
import 'package:doctor_clinic/controller/auth/register/register_provider.dart';
import 'package:doctor_clinic/controller/bottom_nav/bottom_nav.dart';
import 'package:doctor_clinic/controller/user_provider/user_provider.dart';
import 'package:doctor_clinic/view/onbord/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        ),
        ChangeNotifierProvider(
          create: (context) => OtpProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
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
