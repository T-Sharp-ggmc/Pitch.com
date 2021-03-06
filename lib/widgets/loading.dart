import 'package:Pitch/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// da usare nelle schermate di caricamento e salvataggio dati
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.getTheme().backgroundColor,
      child: Center(
        child: SpinKitChasingDots(
          color: AppTheme.getTheme().primaryColor,
          size: 50.0,
        ),
      ),
    );
  }
}