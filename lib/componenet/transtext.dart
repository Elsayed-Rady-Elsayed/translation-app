import 'package:flutter/material.dart';
import 'package:translationapp/componenet/widgets.dart';

class TranslateText extends StatefulWidget {
  TranslateText({ required this.onTextTouched});

  final Function(bool) onTextTouched;

  @override
  _TranslateTextState createState() => _TranslateTextState();
}

class _TranslateTextState extends State<TranslateText> {


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(0.0),
      elevation: 2.0,
      child: Container(
        height: 150.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {
                  this.widget.onTextTouched(true);
                },
                child: Container(
                  width: double.infinity,
                  padding:
                  EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  child: Text(
                    "Enter text",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ActionButton(
                  icon: Icons.camera_alt,
                  text: "Camera",
                ),
                ActionButton(
                  text: "Handwriting",
                  icon: Icons.edit,
                ),
                ActionButton(
                  text: "Conversation",
                   icon: Icons.mic,
                ),
                ActionButton(
                  icon: Icons.keyboard_voice,
                  text: "Voice",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}