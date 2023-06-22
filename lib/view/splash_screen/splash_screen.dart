import 'package:bazar/firebase_services/splash_service.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  SplashService splashService = SplashService();

  @override
  void initState() {
    splashService.isLogin(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: 
      Center(
        child: Image.asset('assets/images/veg_splash.jpg') ,

      ),
    );
  }
}