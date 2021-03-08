import 'package:Pitch/widgets/customAppBar.dart';
import 'package:Pitch/widgets/customInputDecorator.dart';
import 'package:flutter/material.dart';
import '../../appTheme.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static String routeName = "/forgotPassword";
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  
  final _formKey = GlobalKey<FormState>();
  String email ='';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: AppTheme.getTheme().backgroundColor,
        appBar: NewCustomAppBar(nameOfPage: "Recupera la tua password"),
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
                              top: 16.0, bottom: 16.0, left: 24, right: 24),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Inserisci la tua email per ricevere una mail per\nresettare la tua password",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.getTheme().disabledColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppTheme.getTheme().backgroundColor,
                              borderRadius: BorderRadius.all(Radius.circular(38)),
                              // border: Border.all(
                              //   color: HexColor("#757575").withOpacity(0.6),
                              // ),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: AppTheme.getTheme().dividerColor,
                                  blurRadius: 8,
                                  offset: Offset(4, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16, right: 16),
                              child: Container(
                                height: 50,
                                child: Center(
                                  child: TextFormField(
                                  obscureText: true,
                                  decoration: textInputDecoration.copyWith(hintText:"Email"),
                                  validator: (val) => val.isEmpty ? 'Inserire la tua email' : null,
                                  onChanged: (val) => {
                                    setState(() => email = val)
                                  },
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
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, bottom: 8, top: 16),
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
                                  if(_formKey.currentState.validate()){
                                    // gestire invio email per recuper password
                                    Navigator.pop(context);
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    "Invia",
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
            ],
          ),
        ),
      ),
    );
  }
}