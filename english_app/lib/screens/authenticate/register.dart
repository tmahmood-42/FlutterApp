import 'package:flutter/material.dart';
import 'package:english_app/services/auth.dart';
import 'package:english_app/utils/constants/inputs.dart';
import 'package:english_app/utils/widgets/loadingscreen.dart';
import 'package:english_app/screens/entryscreen.dart';


class Register extends StatefulWidget {

  final Function toggleView;
  const Register({required this.toggleView, super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Color(0xFFE0E1DD),
      appBar: AppBar(
        backgroundColor: Color(0xFF415A77),
        elevation: 0.0,
        title: Text('Register for English Advantage'),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.person, color: Colors.black,),
            label: Text(
              'Sign In',
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
                    dynamic result = await _auth.registerWithEmailandPassword(email, password);
                    if (result == null) {
                      if (mounted) {
                        setState((){
                          error = 'Please Use Valid Credentials';
                          loading = false;
                        });
                      }
                    }
                  }
                },
                child: Text(
                  'Register',
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
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        backgroundColor: Color(0xFF415A77),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EntryScreen()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
} 