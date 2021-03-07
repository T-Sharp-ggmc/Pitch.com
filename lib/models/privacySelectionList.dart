class PrivacySelectionListData {
  String titleTxt;
  String subTxt;
  bool isSelected;

  PrivacySelectionListData({
    this.titleTxt = '',
    this.subTxt = '',
    this.isSelected = false,
  });

  static List<PrivacySelectionListData> privacySearchList = [
    PrivacySelectionListData(
      titleTxt: "Coockie funzionali (e tecnologie simili) - \nobbligatori",
      subTxt: "Se non sono attivi, il nostro sito e le nostre app \nnon funzionano bene. Sono importantissimi per le \nfunzionalità relative a sicurezza e accessibilità,\ne ti aiutano nella ricerca e nella prenotazione.",
      isSelected: false,
    ),
    PrivacySelectionListData(
      titleTxt: "Cookie analitici (e tecnologie simili)",
      subTxt: "Analizzano il modo in cui viene usato il sito. \nUtilizziamo questi dati per migliorare il nostro sito \ne i nostri servizi",
      isSelected: false,
    ),
    PrivacySelectionListData(
      titleTxt: "Cookie di marketing (e tecnologie simili)",
      subTxt: "Aiutano noi e i nostri partner di fiducia a mostrarti i \nprodotti e le pubblicità più rilevanti per te, sia sul sito \nche sulle app. Ti permettono anche di mettere \"like\" ai contenuti e di condividerli sui social media.",
      isSelected: false,
    ),
  ];
}