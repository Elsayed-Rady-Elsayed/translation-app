import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translationapp/models/language.dart';

class ActionButton extends StatefulWidget {
  ActionButton({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  Widget _displayIcon() {
    if (this.widget.icon != null) {
      return Icon(
        this.widget.icon,
        size: 23.0,
        color: Colors.blue[800],
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: FlatButton(
        padding: EdgeInsets.only(
          left: 8.0,
          right: 8.0,
          top: 2.0,
          bottom: 2.0,
        ),
        onPressed: () {},
        child: Column(
          children: <Widget>[
            _displayIcon(),
            Text(
              this.widget.text,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageListElement extends StatefulWidget {
  LanguageListElement({required this.language, required this.onSelect});
  final Language language;
  final Function(Language) onSelect;

  @override
  _LanguageListElementState createState() => _LanguageListElementState();
}

class _LanguageListElementState extends State<LanguageListElement> {
  Widget _displayTrailingIcon() {
    if (this.widget.language.isDownloadable) {
      if (this.widget.language.isDownloaded) {
        return Icon(Icons.check_circle);
      } else {
        return Icon(Icons.file_download);
      }
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
            onTap: () {
        this.widget.onSelect(this.widget.language);
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
     Text(this.widget.language.name),
     Spacer(),
     this._displayTrailingIcon()
          ],
        ),
      ),
    );
  }
}
class CircleIconButton extends StatelessWidget {
  final double size;
  final Function onPressed;
  final IconData icon;

  CircleIconButton({this.size = 30.0, this.icon = Icons.clear, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment(0.0, 0.0), // all centered
          children: <Widget>[
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey[300]),
            ),
            Icon(
              icon,
              size: size * 0.6, // 60% width for icon
            )
          ],
        ),
      ),
    );
  }
}