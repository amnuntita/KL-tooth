import 'package:flutter/material.dart';

class Picker extends StatefulWidget {
  final String title;
  final List<String> choices;
  final double h;
  final Function(String) onChange;
  const Picker({
    Key key,
    @required this.title,
    @required this.choices,
    this.h,
    this.onChange,
  }) : super(key: key);

  @override
  _PickerState createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  int _radioValue;
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
          height: h ?? 200,
          child: ListView.builder(
              itemCount: choices.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: (Row(
                    children: <Widget>[
                      Radio(
                        value: index,
                        groupValue: _radioValue,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue = value;
                          });
                        },
                      ),
                      Text(
                        '${choices[index]}',
                        style: Theme.of(context).textTheme.bodyText1,
                      )
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
                this.widget.onChange(choices[_radioValue]);
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
