import 'package:english_app/screens/authenticate/authenticate.dart';
import 'package:english_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:english_app/models/app_user.dart';
import 'package:english_app/Homework/formal_questions.dart';
import 'package:english_app/screens/menu.dart';
import 'package:english_app/screens/altTest.dart';

class Wrapper extends StatelessWidget {
  Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    
    final appUser = Provider.of<AppUser?>(context);
    // return Authenticate or Home
    
    if (appUser == null) {
      return Authenticate();
    } else {
      return MainSigninOrRegister();
    }
  }
}