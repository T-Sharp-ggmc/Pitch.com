class User {

  final String uid;
  
  User({ this.uid });

}

class UserData {

   String uid; //da usare per unificare l'utente con firestore
   String name;
   String surname;
   String email;
   DateTime birthDate;
   String phone;

  UserData(this.name, this.surname, this.email, this.phone, this.birthDate, {this.uid});

}