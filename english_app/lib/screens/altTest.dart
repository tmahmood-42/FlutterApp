import 'package:flutter/material.dart';

class MainSigninOrRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack with Scaffold'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 474, // Y-coordinate from the top of the screen
            left:68, // X-coordinate from the left of the screen
            width: 254, // Adjust the width of the button
            height: 50, // Adjust the height of the button
            child: ElevatedButton(
              onPressed: () {
                // Button action goes here
                print('Button pressed');
              },
              child: Text('Sign In'),
            ),
          ),
          Positioned(
            top: 600, // Y-coordinate from the top of the screen
            left: 68, // X-coordinate from the left of the screen
            width: 254, // Adjust the width of the button
            height: 50, // Adjust the height of the button
            child: ElevatedButton(
              onPressed: () {
                // Button action goes here
                print('Button pressed');
              },
              child: Text('Create New Account'),
            ),
          ),
          Positioned(
            top: 394,
            left: 32,
            width: 327,
            height: 44,
            child: Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white)
            ),
          ),
        ],
      ),
    );
  }
}
