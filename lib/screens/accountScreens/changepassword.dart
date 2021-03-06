import 'package:Pitch/widgets/customInputDecorator.dart';
import 'package:flutter/material.dart';
import '../../appTheme.dart';
import '../../widgets/customAppBar.dart';

class ChangepasswordScreen extends StatefulWidget {
  static String routeName = "/changePassword";
  @override
  _ChangepasswordScreenState createState() => _ChangepasswordScreenState();
}

class _ChangepasswordScreenState extends State<ChangepasswordScreen> {

  final _formKey = GlobalKey<FormState>();
  String error = '';
  String oldPassword ='';
  String newPassword1 ='';
  String newPassword2 = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NewCustomAppBar(nameOfPage: "Cambia Password"),
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
                  child:Form(
                    key: _formKey,
                    child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppTheme.getTheme().backgroundColor,
                            borderRadius: BorderRadius.all(Radius.circular(38)),
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
                                  decoration: textInputDecoration.copyWith(hintText:"Vecchia password"),
                                  validator: (val) => val.isEmpty ? 'Inserire la vecchia password' : null,
                                  onChanged: (val) => {
                                    setState(() => oldPassword = val)
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
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppTheme.getTheme().backgroundColor,
                            borderRadius: BorderRadius.all(Radius.circular(38)),
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
                                  decoration: textInputDecoration.copyWith(hintText:"Nuova password"),
                                  validator: (val) => val.isEmpty ? 'Inserire la nuova password' : val == oldPassword ? 'Non è possibile usare la vecchia password': null,
                                  onChanged: (val) => {
                                    setState(() => newPassword1 = val)
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
                      SizedBox(
                        height: 16,
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
                                  decoration: textInputDecoration.copyWith(hintText:"Conferma nuova password"),
                                  validator: (val) => val.isEmpty ? 'Inserire la nuova password' : val != newPassword1 ? 'Le due password non coincidono' : null,
                                  onChanged: (val) => {
                                    setState(() => newPassword2 = val)
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
                                if(_formKey.currentState.validate()){}
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
            ],
          ),
        ),
    );
  }
}
