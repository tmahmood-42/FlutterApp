import 'package:flutter/material.dart';
import 'package:english_app/services/auth.dart';

class Home extends StatelessWidget {
  //const Home({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('English Advantage'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person, color: Colors.black,),
            label: Text(
              'Logout',
              style: TextStyle(color: Colors.black,),
            ),
            onPressed: () async{
              await _auth.signOut();
            },
          )
        ],
      )
    );
  }
}