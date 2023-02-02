import 'package:flutter/material.dart';
import 'package:translationapp/models/language.dart';
import 'package:translationapp/screens/languagePage.dart';

class ChooseLanguage extends StatefulWidget {
  ChooseLanguage({ required this.onLanguageChanged});

  final Function(Language firstCode, Language secondCode) onLanguageChanged;

  @override
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  Language _firstLanguage = Language('en', 'English', true, true, true);
  Language _secondLanguage = Language('fr', 'French', true, true, true);

  // Switch the first and the second language
  void _switchLanguage() {
    Language _tmpLanguage = this._firstLanguage;

    setState(() {
      this._firstLanguage = this._secondLanguage;
      this._secondLanguage = _tmpLanguage;
    });

    this.widget.onLanguageChanged(this._firstLanguage, this._secondLanguage);
  }

  // Choose a new first language
  void _chooseFirstLanguage(String title, bool isAutomaticEnabled) async {
    final language = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LanguagePage(
              title: title,
              isAutomaticEnabled: isAutomaticEnabled,
            ),
      ),
    );

    if (language != null) {
      this.setState(() {
        this._firstLanguage = language;
      });

      this.widget.onLanguageChanged(this._firstLanguage, this._secondLanguage);
    }
  }

  // Choose a new second language
  void _chooseSecondLanguage(String title, bool isAutomaticEnabled) async {
    final language = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LanguagePage(
              title: title,
              isAutomaticEnabled: isAutomaticEnabled,
            ),
      ),
    );

    if (language != null) {
      this.setState(() {
        this._secondLanguage = language;
      });

      this.widget.onLanguageChanged(this._firstLanguage, this._secondLanguage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.grey[500]!,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  this._chooseFirstLanguage("Translate from", true);
                },
                child: Center(
                  child: Text(
                    this._firstLanguage.name,
                    style: TextStyle(
                      color: Colors.blue[600],
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Material(
            color: Colors.white,
            child: IconButton(
              icon: Icon(
                Icons.compare_arrows,
                color: Colors.grey[700],
              ),
              onPressed: this._switchLanguage,
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  this._chooseSecondLanguage("Translate to", true);
                },
                child: Center(
                  child: Text(
                    this._secondLanguage.name,
                    style: TextStyle(
                      color: Colors.blue[600],
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}