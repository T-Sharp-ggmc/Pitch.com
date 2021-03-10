import 'package:my_camping/services/authService.dart';
import 'package:my_camping/widgets/customAppBar.dart';
import 'package:my_camping/widgets/customInputDecorator.dart';
import 'package:my_camping/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_camping/appTheme.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = "/signUp";
  final Function toggleView;
  SignUpScreen({this.toggleView});
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  String nome = '';
  String cognome = '';
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: AppTheme.getTheme().backgroundColor,
            appBar: SignCustomAppBar(
              nameOfPage: "Registrati",
            ),
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
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 32),
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 24,
                                    ),
                                    Expanded(
                                      child: getFTButton(),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: getFTButton(isFacebook: false),
                                    ),
                                    SizedBox(
                                      width: 24,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "o registrati con la tua mail",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.getTheme().disabledColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 24, right: 24, bottom: 16),
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
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  child: Container(
                                    height: 50,
                                    child: Center(
                                      child: TextFormField(
                                        decoration: textInputDecoration
                                            .copyWith(hintText: "Nome"),
                                        validator: (val) => val.isEmpty
                                            ? 'Inserire il tuo nome'
                                            : null,
                                        onChanged: (val) =>
                                            {setState(() => nome = val)},
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
                                  left: 24, right: 24, bottom: 16),
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
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  child: Container(
                                    height: 48,
                                    child: Center(
                                      child: TextFormField(
                                        decoration: textInputDecoration
                                            .copyWith(hintText: "Cognome"),
                                        validator: (val) => val.isEmpty
                                            ? 'Inserire il tuo cognome'
                                            : null,
                                        onChanged: (val) =>
                                            {setState(() => cognome = val)},
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
                              padding:
                                  const EdgeInsets.only(left: 24, right: 24),
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
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  child: Container(
                                    height: 48,
                                    child: Center(
                                      child: TextFormField(
                                        decoration: textInputDecoration
                                            .copyWith(hintText: "Email"),
                                        validator: (val) => val.isEmpty
                                            ? 'Inserire la tua email'
                                            : null,
                                        onChanged: (val) =>
                                            {setState(() => email = val)},
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
                                  left: 24, right: 24, top: 16),
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
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  child: Container(
                                    height: 48,
                                    child: Center(
                                      child: TextFormField(
                                        obscureText: true,
                                        decoration: textInputDecoration
                                            .copyWith(hintText: "Password"),
                                        validator: (val) => val.isEmpty
                                            ? 'Inserire la tua password'
                                            : val.length < 6
                                                ? "Inserisci una password con più di 6 caratteri"
                                                : null,
                                        onChanged: (val) =>
                                            {setState(() => password = val)},
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
                                    onTap: () async {
                                      if (_formKey.currentState.validate()) {
                                        setState(() => loading = true);
                                        dynamic result = await _authService
                                            .registerWithEmailAndPassword(
                                                nome, cognome, email, password);
                                        if (result == null) {
                                          setState(() {
                                            loading = false;
                                            error =
                                                "Non è possibile creare un account con questi dati";
                                          });
                                        }
                                      }
                                    },
                                    child: Center(
                                      child: Text(
                                        "Registrati",
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
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "Registrandoti, accetti i termini di\nservizio e le politiche di Privacy",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.getTheme().disabledColor,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Hai già un account?",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppTheme.getTheme().disabledColor,
                                  ),
                                ),
                                InkWell(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  onTap: () => widget.toggleView(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Log in",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.getTheme().primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              error,
                              style:
                                  TextStyle(color: Colors.red, fontSize: 14.0),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }

  Widget getFTButton({bool isFacebook: true}) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: HexColor(isFacebook ? "#3C5799" : "#05A9F0"),
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
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
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          highlightColor: Colors.transparent,
          onTap: () {},
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                    isFacebook
                        ? FontAwesomeIcons.facebookF
                        : FontAwesomeIcons.twitter,
                    size: 20,
                    color: Colors.white),
                SizedBox(
                  width: 4,
                ),
                Text(
                  isFacebook ? "Facebook" : "Twitter",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
