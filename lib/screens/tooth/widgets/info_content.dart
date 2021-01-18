import 'package:flutter/material.dart';

class InfoContent extends StatelessWidget {
  final String title;
  final String img;
  final String subtitle1;
  final String subtitle2;
  final String content;
  const InfoContent({
    Key key,
    @required this.title,
    @required this.img,
    this.subtitle1,
    this.subtitle2,
    @required this.content,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            title,
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyText1.fontSize + 8,
                color: Theme.of(context).primaryColorDark),
          ),
        ),
        Image.asset(
          'assets/images/$img.png',
          width: 100,
          height: 100,
        ),
        Visibility(
          visible: subtitle1 != null,
          child: Column(
            children: <Widget>[
              Text(subtitle1 ?? ''),
              SizedBox(
                height: 10,
              ),
              Text(subtitle2 ?? ''),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
          child: Text(
            content,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        SizedBox(height: 50),
      ],
    );
  }
}
