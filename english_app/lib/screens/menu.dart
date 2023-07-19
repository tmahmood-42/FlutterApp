import 'package:flutter/material.dart';
import 'package:english_app/screens/home/home.dart';
import 'package:english_app/Homework/formal_questions.dart';
import 'package:english_app/Homework/slang.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0E1DD),
      appBar: AppBar(
        backgroundColor: Color(0xFF415A77),
        title: Text('Menu'),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(25.0, 100.0, 25.0, 75.0),
                child: SizedBox(
                  width: 200.0,
                  height: 54.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    child: Text('User Settings'),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Adjust the border radius for button curvature
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF778DA9)),
                    ),
                  ),
                ),
              ),
            ),
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
                        MaterialPageRoute(builder: (context) => DisplayFQ()),
                      );
                    },
                    child: Text('Display Questions'),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Adjust the border radius for button curvature
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF778DA9)),
                    ),
                  ),
                ),
              ),
            ),
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
                        MaterialPageRoute(builder: (context) => DisplaySlang()),
                      );
                    },
                    child: Text('Slang'),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Adjust the border radius for button curvature
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF778DA9)),
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
