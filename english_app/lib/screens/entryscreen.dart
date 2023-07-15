import 'package:flutter/material.dart';
import 'package:english_app/screens/wrapper.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class EntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFe0e1dd),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/applogo.png', // Replace with the path to your app logo image
              width: 200,
              height: 200,
            ),
            SizedBox(height: 15), // Space 15 pixels below the app logo
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Wrapper()),
                );},
              child: Text('Button'),
            ),
          ],
        ),
      ),
    );
  }
}