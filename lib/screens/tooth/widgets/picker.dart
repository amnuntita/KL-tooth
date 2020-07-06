import 'package:flutter/material.dart';

class Picker extends StatefulWidget {
  final String title;
  final List<String> choices;
  final double h;
  const Picker({
    Key key,
    @required this.title,
    @required this.choices,
    @required this.h,
  }) : super(key: key);

  @override
  _PickerState createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  int _ageRadioValue;
  @override
  Widget build(BuildContext context) {
    String title = this.widget.title;
    List<String> choices = this.widget.choices;
    double h = this.widget.h;

    return SimpleDialog(
      title: Center(
          child: Text(
        '$title',
        style: TextStyle(fontSize: 30),
      )),
      children: <Widget>[
        Container(
          color: Color(0xFFBBD7F0),
          width: 375,
          height: h,
          child: ListView.builder(
              itemCount: choices.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: (Row(
                    children: <Widget>[
                      Radio(
                        value: index,
                        groupValue: _ageRadioValue,
                        onChanged: (int value) {
                          setState(() {
                            _ageRadioValue = value;
                            print(_ageRadioValue);
                          });
                        },
                      ),
                      Text('${choices[index]}')
                    ],
                  )),
                );
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('CANCLE'),
            ),
            FlatButton(
              onPressed: () {
                //onSelect(choices[_ageRadioValue]);
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        )
      ],
    );
  }
}
