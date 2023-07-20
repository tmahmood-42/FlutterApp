import 'package:flutter/material.dart';
import 'package:english_app/screens/wrapper.dart';
import 'dart:async';

class EntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0E1DD),
      body: Container(
        child: Column(
          children: [
            // AppLogo
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(25.0, 175.0, 25.0, 0.5), // Add padding here
                child: Image.asset(
                  'lib/assets/applogo.png',
                  width: 200.0,
                  height: 200.0,
                ),
              ),
            ),
            // 'English Advntage' text
            Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25.0, 1.0, 25.0, 100.0),
                  child: Text(
                  "English Advantage",
                  style: TextStyle(
                    color: Color(0xFF415A77),
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Angkor',
                  )
                ),
              ),
            ),
            // Button
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 75.0),
                child: SizedBox(
                  width: 200.0,
                  height: 54.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SplashScreen()),
                      );
                    },
                    child: Text('Start Here'),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Adjust the border radius for button curvature
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF415A77)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();

    // Delay for a few seconds and then animate away
    Timer(Duration(seconds: 3), () {
      setState(() {
        _isVisible = false;
      });

      // Navigate to the desired screen with fade-in animation
      Navigator.push(
        context,
        PageRouteBuilder(
          opaque: false,
          pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 2.0).animate(animation), // Adjust the opacity animation
            child: Wrapper(),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0E1DD),
      body: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0.0,
        duration: Duration(seconds: 1),
        child: Center(
          child: Container(
            child: Center(
              child: Text(
                'Welcome!',
                style: TextStyle(fontSize: 40.0, color: Color(0xFF415A77)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
