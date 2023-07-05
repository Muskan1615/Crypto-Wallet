import 'dart:async';
import 'package:flutter/material.dart';
import '../screens/slider_screen.dart';
import '../theme/gradient.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) {
          return const SliderScreen();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShaderMask(
              shaderCallback: (bounds) => Gradients.customShader(
                bounds,
                Gradients.gradient2,
              ),
              child: Text(
                'DCY',
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontFamily: 'AvenirNextLT',
                      fontSize: 74,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Text(
              'CRYPTO WALLET',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
