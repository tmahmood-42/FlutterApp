// User Authentication
import 'package:english_app/models/app_user.dart' show AppUser;
import 'package:english_app/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // creates user object upon firebase user
  AppUser? _userFromFirebaseUser(User? user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<AppUser?> get appUser {
    return _auth.authStateChanges().map((User? user) => _userFromFirebaseUser(user));
      //.map((User user) => _userFromFirebaseUser(user));
      // Line 17& Line 18 Are the Same
      //.map(_userFromFirebaseUser);
  }
  // Type User is used for Firebase User Object

  // Guest Sign In
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
  Future signInWithEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  // register new users
  Future registerWithEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      // Create a New User with UID and update to FireStorage
      if (user != null) {
      await DatabaseService(uid: user.uid).updateUserData('N/A', 'New User', 100);}

      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  // sign-out functions
  Future signOut()async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
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