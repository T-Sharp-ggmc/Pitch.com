class HelpSelectionListData {
  String titleTxt;
  String subTxt;
  bool isSelected;

  HelpSelectionListData({
    this.titleTxt = '',
    this.subTxt = '',
    this.isSelected = false,
  });

  static List<HelpSelectionListData> helpSearchList = [
    HelpSelectionListData(
      titleTxt: 'Pagamenti per una piazzola',
      subTxt: "",
    ),
    HelpSelectionListData(
      titleTxt: '',
      subTxt: "Come posso cancellare \nuna prenotazione?",
    ),
    HelpSelectionListData(
      titleTxt: 'Prenotare una piazzola',
      subTxt: "",
    ),
    HelpSelectionListData(
      titleTxt: '',
      subTxt: "Come posso prenotare \nun campeggio nei preferiti?",
    ),
  ];

  static List<HelpSelectionListData> subHelpList = [
    HelpSelectionListData(
      titleTxt: "",
      subTxt: "Puoi cancellare la prenotazione in qualsiasi momento o durante il tuo soggiorno. Per cancellare la prenotazione:",
    ),
    HelpSelectionListData(
      titleTxt: "",
      subTxt: "Vai sulla scheda profilo e clicca su \"Le mie prenotazioni\"\nClick sulla prenotazione che vuoi cancellare\nClick su Modifica prenotazione",
    ),
    HelpSelectionListData(
      titleTxt: "",
      subTxt: "Verrai portato in una nuova pagina dove potrai cancellare o modificare la tua prenotazione. Click su Next nella sezione \"Cancella prenotazione\" per proseguire",
    ),
    HelpSelectionListData(
      titleTxt: "",
      subTxt: "Se confermi, il tuo rimborso verrà determinato in base alle politiche di cancellazione imposte dal campeggio. Ti mostreremo l'ammontare del rimborso prima di completare la cancellazione",
    ),
    HelpSelectionListData(
      titleTxt: "",
      subTxt: "Lascia un feedback",
      isSelected: true,
    ),
    HelpSelectionListData(
      titleTxt: "Domande simili",
      subTxt: "",
    ),
    HelpSelectionListData(
      titleTxt: "",
      subTxt: "Posso modificare una prenotazione?",
    ),
  ];


}