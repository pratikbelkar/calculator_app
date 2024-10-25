import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:calculator_app/Home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 8.bitLength), () {
      navigateToHomeScreen();
    });
  }

  void navigateToHomeScreen() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => HomePage()), (Route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Center(
        child: Container(
          child: DefaultTextStyle(
            style: TextStyle(color: Colors.deepPurple, fontSize: 35),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText('CALCULATER'),
              ],
              isRepeatingAnimation: true,
            ),
          ),
        ),
      ),
    );
  }
}
