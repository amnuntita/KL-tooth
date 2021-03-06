import 'package:flutter/material.dart';
import 'package:khunlook/screens/appointment/widgets/event_card.dart';
import 'package:khunlook/screens/tooth/widgets/picker_form_field.dart';
import './date_time_picker_form_field.dart';
import 'package:intl/intl.dart' show DateFormat;
import './picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import './tooth_card.dart';

class ToothDialog extends StatefulWidget {
  final String toothName;
  final Function(int) onChange;
  final Function(List<String>) onCardChange;
  const ToothDialog(
      {Key key, @required this.toothName, this.onChange, this.onCardChange})
      : super(key: key);
  @override
  _ToothDialogState createState() => _ToothDialogState();
}

class _ToothDialogState extends State<ToothDialog> {
  DateTime initDate = DateTime.now();
  String select = 'ฟันขึ้น';
  List<Widget> eventList = [];

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
            Row(
              children: <Widget>[
                Text(
                  'เพิ่มข้อมูลฟัน ${this.widget.toothName}',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(color: Theme.of(context).accentColor),
                ),
                SizedBox(
                  width: 20,
                ),
                Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 15.0,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppDateTimePickerFormField(
                    label: 'วันที่ *',
                    initialValue:
                        DateFormat.yMMMd('th_TH').format(initDate).toString(),
                    format: DateFormat.yMMMd('th_TH'),
                    onDateChange: (DateTime date) {
                      setState(() {
                        initDate = date;
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
                    initialValue: select,
                    picker: Picker(
                      title: 'เหตุการณ์ *',
                      choices: teethEvent,
                      h: 250,
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
                      color: Theme.of(context).primaryColorLight,
                      textColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          eventList.add(ToothCard(
                              this.widget.toothName,
                              DateFormat.yMMMd('th_TH')
                                  .format(initDate)
                                  .toString(),
                              select));
                          this.widget.onChange(teethEvent.indexOf(select));
                        });
                      },
                      child: Text('บันทึก')),
                ),
              ],
            ),
            SingleChildScrollView(child: Column(children: eventList))
          ],
        ),
      ),
    ]);
  }
}
