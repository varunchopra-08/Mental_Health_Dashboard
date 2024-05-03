import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mind_wellness/home_page.dart'; // Import your main application screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(), // Display splash screen initially
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    // Logo scale animation
    _logoAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start animations
    _controller.forward();

    // Navigate to main screen after delay
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHome(), // Navigate to main application screen
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set your desired background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo with scale animation
            ScaleTransition(
              scale: _logoAnimation,
              child: Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/img.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Add spacing between logo and text
            // Fading text
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: Duration(seconds: 2),
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: child,
                );
              },
              child: Text(
                'Zenzone',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

