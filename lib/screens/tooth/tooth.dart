import 'package:flutter/material.dart';
import './widgets/teeth_button.dart';
import './widgets/info.dart';

class Tooth extends StatefulWidget {
  @override
  _ToothState createState() => _ToothState();
}

class _ToothState extends State<Tooth> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset('assets/images/teeth_gum.png'),
                    ),
                  ],
                ),
              ),
              //bottom
              Center(
                  child: Text(
                'กดที่ฟันเพื่อเพิ่ม/ดูข้อมูล',
                style: TextStyle(fontSize: 25.0),
              )),
              TeethButton(160, 470, '1r'),
              TeethButton(200, 470, '1l'),
              TeethButton(117, 460, '4r'),
              TeethButton(243, 460, '4l'),
              TeethButton(75, 435, '8r'),
              TeethButton(285, 435, '8l'),
              TeethButton(50, 395, '6r'),
              TeethButton(55, 345, '9r'),
              TeethButton(315, 395, '6l'),
              TeethButton(315, 345, '9l'),

              //top
              TeethButton(200, 170, '2l'),
              TeethButton(243, 180, '3l'),
              TeethButton(280, 200, '7l'),
              TeethButton(310, 240, '5l'),
              TeethButton(310, 290, '10l'),
              TeethButton(160, 170, '2r'),
              TeethButton(117, 180, '3r'),
              TeethButton(80, 200, '7r'),
              TeethButton(50, 240, '5r'),
              TeethButton(55, 290, '10r'),
              Positioned(
                  top: 10,
                  right: 10,
                  child: InkResponse(
                    onTap: () {
                      print('info');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Info()));
                    },
                    child: Icon(
                      Icons.info,
                      size: 30.0,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
