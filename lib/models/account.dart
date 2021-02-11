import 'package:flutter/material.dart';

class Account {
  IconData iconData;
  String name;
  String surname;
  String phone;
  String birthDate;
  String address;

  Account({
    this.iconData = Icons.supervised_user_circle, //?
    this.name="Gino",
    this.surname="Pollicino",
    this.phone="3216549870",
    this.birthDate="20, Giugno, 1965",
    this.address="Via sto cazzo, 123, Foggia"
  });

}