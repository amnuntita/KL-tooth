import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    color: Color(0xFFB4E9EC),
                    height: 100,
                  ),
                  Positioned(
                    top: 20,
                    left: 10,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('12 เดือน - 18 เดือน'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 50.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          height: 1000,
                          width: 380,
                        ),
                      ),
                      SizedBox(height: 20),
                      Stack(children: [
                        Container(
                          color: Color(0xFFB4E9EC),
                          height: 100,
                        ),
                        Center(
                            child: Container(
                          margin: EdgeInsets.only(top: 50),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5.0)),
                          width: 380,
                          height: 300,
                        )),
                      ]),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
