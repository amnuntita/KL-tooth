import 'package:flutter/material.dart';
import 'package:khunlook/themes/app_themes.dart';
import './widgets/teeth_button.dart';
import './widgets/info.dart';
import './widgets/info_content.dart';

class Tooth extends StatefulWidget {
  @override
  _ToothState createState() => _ToothState();
}

final String loremText =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sodales auctor diam, quis sagittis lectus tristique et. Curabitur id nunc quam. Sed non erat erat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur nisi ipsum, molestie semper tortor ac, condimentum congue lectus. Mauris id vehicula odio, eu vehicula est. Mauris aliquet ante nulla, ultricies tempus urna faucibus at. Vivamus semper tortor ac neque malesuada hendrerit. Etiam lacus orci, fringilla nec tellus eu, suscipit scelerisque mauris. Aenean felis diam, consectetur a est quis, auctor porta libero. Pellentesque vel turpis faucibus, condimentum diam ac, pellentesque metus. Mauris ornare dolor ac tellus semper, at pellentesque nisl posuere. Morbi in dolor id nisi viverra interdum sit amet bibendum felis. Vestibulum sed urna dictum, vestibulum enim pulvinar, tincidunt libero. Nulla ullamcorper blandit mi.';

class _ToothState extends State<Tooth> {
  final List<Widget> adviceList = List.generate(4, (index) {
    return InfoContent(
        title: 'Title $index', img: 'teeth_${index + 1}', content: loremText);
  });
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => SafeArea(
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Theme(
                                      data: appThemeData[AppTheme.ToothTheme],
                                      child: Info(
                                        title: '12 - 18 เดือน',
                                        adviceList: adviceList,
                                        showBottomAdvice: true,
                                        bottomAdvice: loremText,
                                      ),
                                    )));
                      },
                      child: Icon(
                        Icons.info,
                        size: 30.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
