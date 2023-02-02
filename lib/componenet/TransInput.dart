import 'package:flutter/material.dart';
import 'package:translationapp/models/language.dart';
import 'package:translator/translator.dart';

class TranslateInput extends StatefulWidget {
  TranslateInput(
      {required this.onCloseClicked,
      required this.firstLanguage,
      required this.secondLanguage});

  final Function(bool) onCloseClicked;
  final Language firstLanguage;
  final Language secondLanguage;

  @override
  _TranslateInputState createState() => _TranslateInputState();
}

class _TranslateInputState extends State<TranslateInput> {
  TextEditingController _textEditingController = TextEditingController();
  String _textTranslated = "";
  // GoogleTranslator _translator = new GoogleTranslator();

  _onTextChanged(String text) async {
    if (text != "") {
      final res = await text.translate(
          from: this.widget.firstLanguage.code,
          to: this.widget.secondLanguage.code);
      setState(() {
        _textTranslated = res.text;
      });
    } else {
      setState(() {
        _textTranslated = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16.0),
              child: TextField(
                controller: this._textEditingController,
                onChanged: this._onTextChanged,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: RawMaterialButton(
                    onPressed: () {
                      if (this._textEditingController.text != "") {
                        this.setState(() {
                          this._textEditingController.clear();
                          this._textTranslated = "";
                        });
                      } else {
                        this.widget.onCloseClicked(false);
                      }
                    },
                    child: new Icon(
                      Icons.close,
                      color: Colors.grey,
                    ),
                    shape: new CircleBorder(),
                  ),
                ),
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${this._textTranslated}',
                  style: TextStyle(color: Colors.blue[700]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
