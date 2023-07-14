// User Authentication
import 'package:english_app/models/app_user.dart' show AppUser;
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // creates user object upon firebase user
  AppUser? _userFromFirebaseUser(User? user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  // sign in guest
  Future<AppUser?> signInGuest() async {
    try {
            //AuthResult result = await _auth.signInAnonymously(); New Version Below
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email & password

  // register new users

  // sign-out functions
}

/*
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // creates user object upon firebase user
  User _userFromFirebaseUser(User user) {
    return user != null ? User(uid: user.uid) : null;
  }
  // sign in guest
  Future signInGuest() async {
    try{
      //AuthResult result = await _auth.signInAnonymously(); New Version Below
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }
  // sign in with email & password

  // register new users

  // sign-out functions
} 
*/