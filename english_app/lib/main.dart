import 'package:english_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'models/app_user.dart';
import 'package:english_app/screens/entryscreen.dart';

//import 'firebase_options.dart';
//import 'package:english_app/screens/wrapper.dart';
//import 'package:provider/provider.dart'; 
//import 'package:firebase_auth/firebase_auth.dart'; // Firebase auth package
//import 'package:cloud_firestore/cloud_firestore.dart'; //firestroe package
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
      value: AuthService().appUser,
      initialData: null,
      child: MaterialApp(
        title: 'English Advantage',
        home: EntryScreen(),
      ),
    );
  }
}
