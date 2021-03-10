import 'package:my_camping/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'userService.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyCampingUser _userFromFirebaseUser(User user) {
    return user != null ? MyCampingUser(uid: user.uid) : null;
  }

  Stream<MyCampingUser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  String getUserID() {
    final User user = _auth.currentUser;
    final uid = user.uid;
    return uid;
  }

  // log in in anonimo
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // log in
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign in
  Future registerWithEmailAndPassword(
      String name, String surname, String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      //crea una nuova collection per l'utente con il suo uid
      await UserService(uid: user.uid)
          .updateUserData(name, surname, email, "", "", "");
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
