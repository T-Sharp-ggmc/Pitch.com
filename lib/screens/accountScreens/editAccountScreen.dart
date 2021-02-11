import 'package:flutter/material.dart';

import '../../appTheme.dart';

class EditAccountScreen extends StatefulWidget {
  @override
  _EditAccountScreenState createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget getCameraImage() {
    return Positioned(
      bottom: 6,
      right: 6,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.getTheme().primaryColor,
          shape: BoxShape.circle,
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
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.camera_alt,
                color: AppTheme.getTheme().backgroundColor,
                size: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
