import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Language extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  int _selected;

  void switchLanguage(int index) {
    switch (index) {
      case 0:
        EasyLocalization.of(context).locale = Locale("en", "US");
        break;
      case 1:
        EasyLocalization.of(context).locale = Locale("zh", "CN");
        break;
      case 2:
        EasyLocalization.of(context).locale = Locale("zh", "HK");
        break;
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  onPressed: () => {
                    switchLanguage(_selected),
                    Navigator.of(context).pop(),
                  },
                  child: Text(tr('button.save')),
                ))
          ],
        ),
        body: Column(children: [
          InkWell(
            child: ListTile(
              title: Text("English"),
              trailing: _selected == 0
                  ? Icon(
                      Icons.done,
                      color: Colors.green,
                    )
                  : null,
            ),
            onTap: () => setState(() => _selected = 0),
          ),
          Container(color: Colors.black12, height: 1),
          InkWell(
            child: ListTile(
              title: Text(" 简体中文"),
              trailing: _selected == 1
                  ? Icon(
                      Icons.done,
                      color: Colors.green,
                    )
                  : null,
            ),
            onTap: () => setState(() => _selected = 1),
          ),
          Container(color: Colors.black12, height: 1),
          InkWell(
            child: ListTile(
              title: Text(" 繁體中文"),
              trailing: _selected == 2
                  ? Icon(
                      Icons.done,
                      color: Colors.green,
                    )
                  : null,
            ),
            onTap: () => setState(() => _selected = 2),
          ),
        ]));
  }
}
