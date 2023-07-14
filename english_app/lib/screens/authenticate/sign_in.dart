import 'package:english_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:english_app/utils/constants/inputs.dart';
import 'package:english_app/utils/widgets/loadingscreen.dart';


class SignIn extends StatefulWidget {

  final Function toggleView;
  const SignIn({required this.toggleView, super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  
  // To Store appUser Input
  String email = '';
  String password = '';
  String error = '';

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  // Determines when to Display Loading Screen
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor : Colors.brown[100],
      appBar: AppBar(
        backgroundColor : Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign In'),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.person, color: Colors.black,),
            label: Text(
              'Register',
              style: TextStyle(color: Colors.black,),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val?.isEmpty ?? true ?'Enter Email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                }
              ),
              SizedBox(height:20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                validator: (val) => (val?.length ?? 0) < 7 ? 'Enter Password 6+ Characters Long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                }
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[400], // Button background color
                ),
                onPressed: () async {
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
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white), // Text color
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0)
              ),
            ]
          ),
        ),
      )
    );
  }
}