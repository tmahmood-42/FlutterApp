import 'package:english_app/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {

    final AuthService _auth = AuthService();
    
    return Scaffold(
      backgroundColor : Colors.brown[100],
      appBar: AppBar(
        backgroundColor : Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign In'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: ElevatedButton(
          child: Text('Guest Sign-In'),
          onPressed: () async {
            dynamic result = await _auth.signInGuest();
            if (result == null){
              print('Error Signing In');
            } else {
              print('Signed In');
              print (result);
            }
          }
        )
      )
    );
  }
}