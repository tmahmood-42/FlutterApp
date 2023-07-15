import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_app/models/user_data.dart';

class DatabaseService {

  final String? uid;
  DatabaseService({this.uid});

  // Collection References
  final CollectionReference questionCollection = FirebaseFirestore.instance.collection('Questions');
  final CollectionReference userData = FirebaseFirestore.instance.collection('Users');

  // Strength is a current placeholder paramter
  Future updateUserData(String gender, String name, int strength) async{
    return await userData.doc(uid).set({
      'Gender': gender,
      'Name': name,
      'Strength': strength,
    });
  }

  // User List from Snapshot
  List<UserData> _userListFromSnapshot(QuerySnapshot snapshot) {
    try {
      return snapshot.docs.map((doc) {
        return UserData(
          name: doc.get("Name") ?? "",
          gender: doc.get("Gender") ?? "",
          strength: doc.get("Strength") ?? 0,
        );
      }).toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Stream<List<UserData>> get users {
    return userData.snapshots().map(_userListFromSnapshot);
  }

}