import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';




class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds:5),
    );
    _animationController.repeat(reverse: true);
    // Simulate a delay to show the splash page for a few seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splashbackground.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextLiquidFill(
                text: 'Welcome to Amore',
                waveColor: Colors.blue,
                boxBackgroundColor: Colors.white70,
                textStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                boxHeight: 100,
                boxWidth: 300,
              ),
              SizedBox(height: 20),
              RotationTransition(
                turns: Tween(begin: 0.0, end: 3.0).animate(_animationController),
                child: Icon(
                  Icons.store_mall_directory_outlined,
                  color: Colors.red,
                  size: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
