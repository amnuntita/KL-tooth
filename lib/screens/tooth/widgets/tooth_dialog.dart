import 'package:flutter/material.dart';
import 'package:khunlook/screens/tooth/widgets/picker_form_field.dart';
import './date_time_picker_form_field.dart';
import 'package:intl/intl.dart' show DateFormat;
import './picker.dart';

class ToothDialog extends StatelessWidget {
  final String toothName;
  const ToothDialog({Key key, @required this.toothName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<String> teethEvent = ['ฟันขึ้น', 'ฟันผุ', 'ฟันหลุด', 'อุดฟัน'];
    return SimpleDialog(children: [
      Container(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('เพิ่มข้อมูลฟัน $toothName'),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Text('วันที่ *'),
                  AppDateTimePickerFormField(
                      label: 'วันที่ *', format: DateFormat.yMMMd()),
                  /*Container(
                    width: 200,
                    height: 20,
                    color: Colors.grey,
                  )*/
                ]),
            SizedBox(height: 10),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  PickerFormField(
                      label: 'เหตุการณ์ *',
                      picker: Picker(
                          title: 'เหตุการณ์ *', choices: teethEvent, h: 200))
                ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('ยกเลิก')),
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('บันทึก')),
              ],
            )
          ],
        ),
      ),
    ]);
  }
}
