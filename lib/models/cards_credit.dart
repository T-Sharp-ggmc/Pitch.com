class CardsCredit {
  String cardNumber;
  String expiryDate;
  String cardHolderName;
  String cvvCode;
  bool showBackView;
  CardsCredit(
      {this.cardNumber = '',
      this.expiryDate = '',
      this.cardHolderName = '',
      this.cvvCode = '',
      this.showBackView = false});

  static List<CardsCredit> cards = [
    CardsCredit(
      cardNumber: '4242424242424242',
      expiryDate: '04/24',
      cardHolderName: 'Pollicino Michelino',
      cvvCode: '424',
      showBackView: false,
    ),
  ];
}
