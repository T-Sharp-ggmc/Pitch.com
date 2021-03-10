class MyCampingUser {
  final String uid;

  MyCampingUser({this.uid});
}

class UserData {
  final String uid; //da usare per unificare l'utente con firestore
  final String name;
  final String surname;
  final String email;
  final String phone;
  final String birthDate;
  final String sex;

  UserData(
      {this.sex,
      this.name,
      this.surname,
      this.email,
      this.phone,
      this.birthDate,
      this.uid});
}
