import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taski/constants/app_colors.dart';
import 'package:taski/constants/storage_constants.dart';
import 'package:taski/screens/dashboard_screen.dart';
import 'package:taski/screens/login_screen.dart';
import 'package:taski/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  init() async {
    final pref = await SharedPreferences.getInstance();
    bool isFirsTime = pref.getBool(StorageConstants.firstTime) ?? true;

    var isLoggedIn = FirebaseAuth.instance.currentUser != null;

    if (isFirsTime) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
      return;
    }

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
      return;
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
      return;
    }
  }

  @override
  void initState() {
    init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/app_logo.png', height: 170)),
    );
  }
}
