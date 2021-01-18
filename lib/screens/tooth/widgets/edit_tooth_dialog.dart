import 'package:flutter/material.dart';
import 'package:khunlook/screens/appointment/widgets/event_card.dart';
import 'package:khunlook/screens/tooth/widgets/picker_form_field.dart';
import './date_time_picker_form_field.dart';
import 'package:intl/intl.dart' show DateFormat;
import './picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import './tooth_card.dart';

class EditToothDialog extends StatefulWidget {
  final String toothName;
  final String date;
  final String event;
  final Function(int) onChange;
  final Function(List<String>) onCardChange;
  const EditToothDialog(
      {Key key,
      @required this.toothName,
      @required this.date,
      @required this.event,
      this.onChange,
      this.onCardChange})
      : super(key: key);
  @override
  _EditToothDialogState createState() => _EditToothDialogState();
}

class _EditToothDialogState extends State<EditToothDialog> {
  String initDate;
  String select;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    final List<String> teethEvent = [
      'ฟันขึ้น',
      'ฟันผุ',
      'ฟันหลุด',
      'อุดฟัน',
      'ครอบ/ถอน/รักษาราก'
    ];
    return SimpleDialog(children: [
      Container(
        padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: InkResponse(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  Icons.close,
                  size: 20.0,
                ),
              ),
            ),
            Text(
              'แก้ไขข้อมูลฟัน ${this.widget.toothName}',
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(color: Theme.of(context).accentColor),
            ),
            SizedBox(height: 10),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppDateTimePickerFormField(
                    label: 'วันที่ *',
                    initialValue: initDate ?? this.widget.date,
                    format: DateFormat.yMMMd('th_TH'),
                    onDateChange: (DateTime date) {
                      setState(() {
                        initDate =
                            DateFormat.yMMMd('th_TH').format(date).toString();
                      });
                    },
                  ),
                ]),
            SizedBox(height: 10),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  PickerFormField(
                    label: 'เหตุการณ์ *',
                    initialValue: select ?? this.widget.event,
                    picker: Picker(
                      title: 'เหตุการณ์ *',
                      choices: teethEvent,
                      h: 200,
                      onChange: (String val) {
                        setState(() {
                          print(val);
                          select = val;
                        });
                      },
                    ),
                  )
                ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'ยกเลิก',
                      style: TextStyle(color: Colors.red),
                    )),
                Container(
                  width: 90,
                  height: 25,
                  child: FlatButton(
                      color: Color(0xFFC8DEFF),
                      textColor: Colors.white,
                      onPressed: () {
                        //print(initDate);
                        this.widget.onCardChange([initDate, select]);
                        Navigator.of(context).pop();
                      },
                      child: Text('บันทึก')),
                ),
              ],
            ),
          ],
        ),
      ),
    ]);
  }
}
