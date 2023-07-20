import 'package:flutter/material.dart';
import 'package:english_app/services/auth.dart';
import 'package:english_app/utils/widgets/loadingscreen.dart';
import 'package:english_app/Homework/formal_questions.dart';


class SignIn extends StatefulWidget {

  final Function() toggleView;

  const SignIn({required this.toggleView, super.key});

  @override
  State<SignIn> createState() => _SignIn();
}

class _SignIn extends State<SignIn> {

  // To Store appUser Input
  String email = '';
  String password = '';
  String error = '';

  final FormalQuestions formalQuestions = FormalQuestions();
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  // Determines when to Display Loading Screen
  bool loading = false;


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: Stack(
        children: [
          // Login Text
          Positioned(
            left: 49, // X-coordinate from the left of the screen 
            top: 229, // Y-coordinate from the top of the screen
            child: Text(
              'Login',
              style: TextStyle(
                fontFamily: 'Angkor',
                fontSize: 40,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          // Text Below Login Text
          Positioned(
            left: 49,
            top: 293,
            child: Text(
              'Please Sign In to Continue',
              style: TextStyle(
                fontFamily: 'AnonymousPro',
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color(0xFF909090),
              ),
            ),
          ),
          // Email input Box
          Positioned(
            left: 49,
            top: 388,
            child: Container(
              width: 292,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(
                  color: Color(0xFF4361EE), // Border color
                  width: 2.0, // Border width
                ),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: InputBorder.none, // Removes the default underline/border
                  contentPadding: EdgeInsets.symmetric(horizontal: 20), // Add padding to the text
                ),
                validator: (val) => val?.isEmpty ?? true ? 'Enter Email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
            ),
          ),
          // Password Inpit Box
          Positioned(
            left: 49,
            top: 468,
            child: Container(
              width: 292,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(
                  color: Color(0xFF4361EE), // Border color
                  width: 2.0, // Border width
                ),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: InputBorder.none, // Removes the default underline/border
                  contentPadding: EdgeInsets.symmetric(horizontal: 20), // Add padding to the text
                ),
                obscureText: true,
                validator: (val) => (val?.length ?? 0) < 7 ? 'Enter Password 6+ Characters Long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                }
              ),
            ),
          ),
          // Sign In button
          Positioned(
            left: 231, // X-coordinate from the left of the screen
            top: 548, // Y-coordinate from the top of the screen
            child: ElevatedButton(
              style: TextButton.styleFrom(
                minimumSize: Size(110, 44), // Set the desired width and height
                backgroundColor: Color(0xFF4361EE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white, fontFamily: 'Anon',), // Text color
              ),
              onPressed: () async{
                if (_formKey.currentState?.validate() == true) {
                    setState(() => loading = true);
                    dynamic result = await _auth.signInWithEmailandPassword(email, password);
                    if (result == null) {
                      setState((){
                        error = 'ERROR SIGNING IN(FIREBASE)';
                        loading = false;
                      });
                    }
                  }
              },
            ),
          ),
          Positioned(
            left: 63, // X-coordinate from the left of the screen
            top: 782, // Y-coordinate from the top of the screen
            child: Container(
              child: Text(
                'Dont Have an Account',
                style: TextStyle(
                  fontFamily: 'Anon',
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF909090),
                ),
              ),
            ),
          ),
          Positioned(
            left: 259, // X-coordinate from the left of the screen
            top: 782, // Y-coordinate from the top of the screen
            child: GestureDetector(
              onTap: () {
                // Add your onTap callback here
                widget.toggleView();
              },
              child: Container(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontFamily: 'Anon',
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4361EE),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
