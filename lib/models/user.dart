class User {

  final String uid;
  
  User({ this.uid });

}

class UserData {

   final String uid; //da usare per unificare l'utente con firestore
   final String name;
   final String surname;
   final String email;
   //final DateTime birthDate;
   final String phone;

  UserData({this.name, this.surname, this.email, this.phone, this.uid});

}