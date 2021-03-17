import 'package:flutter/material.dart';
import 'package:my_camping/screens/accountScreens/addCard.dart';
import 'package:my_camping/screens/accountScreens/existing-cards.dart';
import 'package:my_camping/services/payment-service.dart';

class PaymentMethodScreen extends StatefulWidget {
  static String routeName = "/paymentMethod";
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

onItemPress(BuildContext context, int index) async {
  switch (index) {
    case 0:
      Navigator.pushNamed(context, AddCard.routeName);
      break;
    case 1:
      Navigator.pushNamed(context, ExistingCardsPage.routeName);
      break;
  }
}

payViaNewCard(BuildContext context) async {}

@override
void initState() {
  StripeService.init();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Modalità di pagamento'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.separated(
            itemBuilder: (context, index) {
              Icon icon;
              Text text;

              switch (index) {
                case 0:
                  icon = Icon(Icons.add_circle, color: theme.primaryColor);
                  text = Text('Inserisci Carta');
                  break;
                case 1:
                  icon = Icon(Icons.credit_card, color: theme.primaryColor);
                  text = Text('Modifica modalità di pagamento');
                  break;
              }

              return InkWell(
                onTap: () {
                  onItemPress(context, index);
                },
                child: ListTile(
                  title: text,
                  leading: icon,
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
                  color: theme.primaryColor,
                ),
            itemCount: 2),
      ),
    );
  }
}
