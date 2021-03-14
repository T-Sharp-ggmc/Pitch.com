import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:my_camping/models/cards_credit.dart';
import 'package:my_camping/services/payment-service.dart';
import 'package:my_camping/utilities/sizeConfig.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:stripe_payment/stripe_payment.dart';

class ExistingCardsPage extends StatefulWidget {
  ExistingCardsPage({Key key}) : super(key: key);
  static String routeName = "/existing-cards";
  @override
  ExistingCardsPageState createState() => ExistingCardsPageState();
}

class ExistingCardsPageState extends State<ExistingCardsPage> {
  payViaExistingCard(BuildContext context, card) async {
    ProgressDialog dialog = new ProgressDialog(context);
    dialog.style(message: 'Please wait...');
    await dialog.show();
    var expiryArr = card['expiryDate'].split('/');
    CreditCard stripeCard = CreditCard(
      number: card['cardNumber'],
      expMonth: int.parse(expiryArr[0]),
      expYear: int.parse(expiryArr[1]),
    );
    var response = await StripeService.payViaExistingCard(
        amount: '2500', currency: 'USD', card: stripeCard);
    await dialog.hide();
    Scaffold.of(context)
        // ignore: deprecated_member_use
        .showSnackBar(SnackBar(
          content: Text(response.message),
          duration: new Duration(milliseconds: 1200),
        ))
        .closed
        .then((_) {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Le tue carte'),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: CardsCredit.cards.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                //payViaExistingCard(context, card);
              },
              child: Stack(children: <Widget>[
                CreditCardWidget(
                  height: SizeConfig.screenWidth / 2,
                  width: SizeConfig.screenHeight,
                  cardNumber: CardsCredit.cards[index].cardNumber,
                  expiryDate: CardsCredit.cards[index].expiryDate,
                  cardHolderName: CardsCredit.cards[index].cardHolderName,
                  cvvCode: CardsCredit.cards[index].cvvCode,
                  showBackView: false,
                ),
                Positioned(
                    top: 170,
                    left: 315,
                    child: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red[900],
                        ),
                        onPressed: () {})),
              ]),
            );
          },
        ),
      ),
    );
  }
}
