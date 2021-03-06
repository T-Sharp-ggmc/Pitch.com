import 'package:Pitch/models/account.dart';
import 'package:Pitch/models/user.dart';
import 'package:Pitch/screens/accountScreens/widgets/calendar.dart';
import 'package:Pitch/sizeConfig.dart';
import 'package:Pitch/widgets/customInputDecorator.dart';
import 'package:flutter/material.dart';
import '../../widgets/customAppBar.dart';
import '../../appTheme.dart';

class EditAccountScreen extends StatefulWidget {
  static String routeName = "/editAccount";
  @override
  _EditAccountScreenState createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  List<AccountInfo> accountInfoList = AccountInfo.accountInfoList;
  final textController = TextEditingController(text: "");
  String newAccountInfo = "";
  String _currentName;
  String _currentSurname;
  String _currentEmail;
  DateTime _currentBirthDate;
  String _currentPhone;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    UserData userData = UserData("Guido","Mazzaro","gmazzaro@gmail.com","3216549870",DateTime(1997, 3, 3));

    textController.text = _currentBirthDate.toString();

    return Scaffold(
      appBar: NewCustomAppBar(nameOfPage: "Modifica Profilo"),
      resizeToAvoidBottomInset: false,
      backgroundColor: AppTheme.getTheme().backgroundColor,
      body: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 24, left: 24, right: 24),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppTheme.getTheme().backgroundColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(38)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: AppTheme.getTheme().dividerColor,
                                  blurRadius: 8,
                                  offset: Offset(4, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: Container(
                                height: 50,
                                child: Center(
                                  child: TextFormField(
                                    decoration: textInputDecoration.copyWith(
                                        hintText: "Nome"),
                                    validator: (val) => val.isEmpty
                                        ? 'Inserisci il tuo nome'
                                        : null,
                                    onChanged: (val) =>
                                        setState(() => _currentName = val),
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, left: 24, right: 24),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppTheme.getTheme().backgroundColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(38)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: AppTheme.getTheme().dividerColor,
                                  blurRadius: 8,
                                  offset: Offset(4, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: Container(
                                height: 50,
                                child: Center(
                                  child: TextFormField(
                                    decoration: textInputDecoration.copyWith(
                                        hintText: "Cognome"),
                                    validator: (val) => val.isEmpty
                                        ? 'Inserisci il tuo cognome'
                                        : null,
                                    onChanged: (val) =>
                                        setState(() => _currentSurname = val),
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, left: 24, right: 24),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppTheme.getTheme().backgroundColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(38)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: AppTheme.getTheme().dividerColor,
                                  blurRadius: 8,
                                  offset: Offset(4, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: Container(
                                height: 50,
                                child: Center(
                                  child: TextFormField(
                                    decoration: textInputDecoration.copyWith(
                                        hintText: "Email"),
                                    validator: (val) => val.isEmpty
                                        ? 'Inserisci la tua email'
                                        : null,
                                    onChanged: (val) =>
                                        setState(() => _currentName = val),
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, left: 24, right: 24),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppTheme.getTheme().backgroundColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(38)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: AppTheme.getTheme().dividerColor,
                                  blurRadius: 8,
                                  offset: Offset(4, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: Container(
                                height: 50,
                                child: Center(
                                  child: TextFormField(
                                    decoration: textInputDecoration.copyWith(
                                        hintText: "Numero di cellulare"),
                                    validator: (val) => val.isEmpty
                                        ? 'Inserisci il tuo numero di cellulare'
                                        : null,
                                    onChanged: (val) =>
                                        setState(() => _currentName = val),
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, left: 24, right: 24),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppTheme.getTheme().backgroundColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(38)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: AppTheme.getTheme().dividerColor,
                                  blurRadius: 8,
                                  offset: Offset(4, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: getProportionateScreenWidth(240),
                                    height: 50,
                                    child: Center(
                                      child: TextFormField(
                                        readOnly: true,
                                        controller: textController,
                                        decoration:
                                            textInputDecoration.copyWith(
                                                hintText: "Data di nascita"),
                                        validator: (val) => val.isEmpty
                                            ? 'Inserisci il tuo numero di cellulare'
                                            : null,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Container(
                                        child: IconButton(
                                      icon: Icon(Icons.calendar_today,
                                          color: AppTheme.getTheme()
                                              .disabledColor
                                              .withOpacity(0.3)),
                                      onPressed: () {
                                        FocusScope.of(context).requestFocus(FocusNode());
                                        // setState(() {
                                        //   isDatePopupOpen = true;
                                        // });
                                        showDemoDialog(context: context);
                                        // apre popup calendario
                                        setState(() {
                                          textController.text = "Data";
                                        });
                                      },
                                    )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, bottom: 8, top: 24),
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              color: AppTheme.getTheme().primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24.0)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: AppTheme.getTheme().dividerColor,
                                  blurRadius: 8,
                                  offset: Offset(4, 4),
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24.0)),
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      userData.name = _currentName;
                                      userData.surname = _currentSurname;
                                      userData.email = _currentEmail;
                                      userData.birthDate = _currentBirthDate;
                                      userData.phone = _currentPhone;  
                                    });
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    "Applica",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ]),
      ),
    );
  }


  void showDemoDialog({BuildContext context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) => Calendar(
        maximumDate: DateTime.now(),
        date: _currentBirthDate,
        onApplyClick: (DateTime applyData) {
          setState(() {
            if (applyData != null) {
              _currentBirthDate = applyData;
            }
          });
        },
      ),
    );
  }
}
