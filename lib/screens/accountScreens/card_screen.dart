import 'package:my_camping/screens/accountScreens/widgets/credit_card.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  static String routeName = "/paymentMethod";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: CreditCard(),
      ),
    );
  }
}
