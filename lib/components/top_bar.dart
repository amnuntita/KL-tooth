import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'ไม่ได้เลือกลูกน้อย',
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text('0 ปี 0 เดือน 0 วัน'),
                ],
              ),
              SizedBox(
                width: 5.0,
              ),
              CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.grey,
              )
            ],
          )
        ],
      ),
    );
  }
}
