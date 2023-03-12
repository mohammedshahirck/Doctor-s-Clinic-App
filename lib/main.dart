import 'package:doctor_clinic/provider/register_provider.dart';
import 'package:doctor_clinic/screens/onbord/welcome_screen.dart';
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
