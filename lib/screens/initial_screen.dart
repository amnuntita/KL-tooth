import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  final String appTitle;

  InitialScreen({
    @required this.appTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          '$appTitle welcome!\n\n'
          '''เวลาทำให้ไปที่ main.dart เพิ่ม route เปลี่ยน initialRoute เป็น route ตัวเองนะ''',
          textAlign: TextAlign.center,
          softWrap: true,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
