import 'package:flutter/material.dart';
import 'package:english_app/services/auth.dart';
import 'package:english_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:english_app/screens/Home/user_list.dart';
import 'package:english_app/models/user_data.dart';
import 'package:english_app/screens/Home/settings_form.dart';
import 'package:english_app/screens/entryscreen.dart';
import 'package:english_app/screens/menu.dart';
import 'package:english_app/Homework/formal_questions.dart';

class Home extends StatelessWidget {
  //const Home({super.key});

  final AuthService _auth = AuthService();

  // FOr Fetching Documents
  FormalQuestions formalQuestions = FormalQuestions();

  @override
  Widget build(BuildContext context) {
    // Shows User Settings
    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }
    return StreamProvider<List<UserData?>>.value(
        value : DatabaseService().users,
        initialData: [],
        child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('User'),
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
            ),
            TextButton.icon(
              icon: Icon(Icons.settings, color: Colors.black),
              label: Text('Settings', style: TextStyle(color: Colors.black,)),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: UserList(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.aod_rounded),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Menu()),
            );
          },
        ),
      ),
    );
  }
}