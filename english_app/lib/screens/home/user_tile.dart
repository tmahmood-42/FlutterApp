import 'package:english_app/models/user_data.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {

  final UserData user;
  UserTile({ required this.user });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[user.strength],
          ),
          title: Text(user.name),
          subtitle: Text('Algorithm Score: ${user.strength} '),
        ),
      ),
    );
  }
}