import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  final String title;
  final List<Widget> adviceList;
  final bool showBottomAdvice;
  final String bottomAdvice;
  const Info({
    Key key,
    @required this.title,
    @required this.adviceList,
    @required this.showBottomAdvice,
    this.bottomAdvice,
  }) : super(key: key);

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
                    color: Theme.of(context).primaryColor,
                    height: 100,
                  ),
                  Column(
                    children: <Widget>[
                      Center(
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            margin: EdgeInsets.only(top: 60.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            width: 380,
                            child: Column(
                              children: adviceList,
                            )),
                      ),
                      SizedBox(height: 20),

                      //Bottom Advice

                      Visibility(
                        visible: showBottomAdvice,
                        child: Stack(children: [
                          Container(
                            color: Theme.of(context).primaryColor,
                            height: 100,
                          ),
                          Center(
                              child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 10.0),
                            margin: EdgeInsets.only(top: 50),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5.0)),
                            width: 380,
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/doctor_m.png',
                                  width: 120,
                                  height: 120,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Text(
                                    bottomAdvice,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                )
                              ],
                            ),
                          )),
                        ]),
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                  Positioned(
                    top: 8,
                    left: 5,
                    child: Image.asset(
                      'assets/images/doctor_fm.png',
                      width: 120,
                      height: 60,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 90,
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.bodyText1.fontSize +
                                    15,
                            color: Theme.of(context).primaryColorDark),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
