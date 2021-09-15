import 'package:my_camping/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final String uid;
  UserService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> updateUserData(String name, String surname, String email,
      String phone, String birthDate, String sex) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'surname': surname,
      'email': email,
      'phone': phone,
      'birthDate': birthDate,
      'sex': sex
    });
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(
      DocumentSnapshot<Map<dynamic, dynamic>> snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data()['name'],
        surname: snapshot.data()['surname'],
        email: snapshot.data()['email'],
        phone: snapshot.data()['phone'],
        birthDate: snapshot.data()['birthDate'],
        sex: snapshot.data()['sex']);
  }

  Stream<UserData> get userData {
    return userCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
