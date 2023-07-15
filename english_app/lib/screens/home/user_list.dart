import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:english_app/models/user_data.dart';
import 'package:english_app/screens/home/user_tile.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}
class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<UserData?>?>(context);

    return ListView.builder(
      itemCount: users?.length ?? 0,
      itemBuilder: (context, index) {
        final user = users![index];
        if (user != null) {
          return UserTile(user: user);
        } else {
          // Handle the case when user is null, if needed
          return SizedBox(); // or any other placeholder widget
        }
      },
    );
  }
}


/*
users?.forEach((user) {
if (user != null) {
  print(user.name);
  print(user.gender);
  print(user.strength);
  }
});
*/