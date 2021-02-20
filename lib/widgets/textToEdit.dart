import 'package:Pitch/models/account.dart';
import 'package:flutter/material.dart';

class TextToEdit extends StatefulWidget {
  //final String labelName;
  final AccountInfo accountInfo;
  final Function(String) callback;

  const TextToEdit({Key key, this.accountInfo, this.callback})
      : super(key: key);

  @override
  _TextToEditState createState() => _TextToEditState();
}

class _TextToEditState extends State<TextToEdit> {
  final textController = TextEditingController(text: "");

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    textController.text = widget.accountInfo.infoDescription is int
        ? "CAP"
        : widget.accountInfo.infoDescription is Sex
            ? "Sesso"
            : widget.accountInfo.infoDescription;

    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: TextFormField(
        onEditingComplete: () {
          try {
            print(textController.text);
            widget.callback(textController.text);
          } catch (e) {}
        },
        controller: textController,
        decoration: InputDecoration(
          labelText: widget.accountInfo.infoName,
        ),
      ),
    );
  }
}
