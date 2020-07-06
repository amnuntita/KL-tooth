import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart' show DateFormat;

class AppDateTimePickerFormField extends StatelessWidget {
  final String label;
  final DateTime initialValue;
  final DateFormat format;

  const AppDateTimePickerFormField({
    Key key,
    @required this.label,
    @required this.format,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 100,
              child: Text(
                label ?? 'Loading...',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.black),
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 5.0),
              width: 200,
              height: 20.0,
              child: TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: InputBorder.none,
                ),
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .apply(fontSizeDelta: 2.0),
                initialValue:
                    format.format(initialValue ?? DateTime.now()).toString(),
                onTap: () async {
                  DateTime date = await DatePicker.showDatePicker(
                    context,
                    showTitleActions: true,
                    theme: DatePickerTheme(
                      containerHeight: 300.0,
                      doneStyle: Theme.of(context).textTheme.headline1.apply(
                            color: Theme.of(context).primaryColorDark,
                          ),
                      itemStyle: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .apply(fontSizeDelta: 8.0),
                    ),
                    onConfirm: (date) {
                      print(date);
                    },
                    currentTime: DateTime.now(),
                    locale: LocaleType.th,
                  );
                  /*if (date != null) {
                    DateTime time = await DatePicker.showTimePicker(
                      context,
                      showSecondsColumn: false,
                      showTitleActions: true,
                      theme: DatePickerTheme(
                        doneStyle: Theme.of(context).textTheme.headline1.apply(
                              color: Theme.of(context).primaryColor,
                            ),
                        itemStyle: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .apply(fontSizeDelta: 8.0),
                      ),
                      onConfirm: (time) {
                        print(time);
                      },
                      currentTime: DateTime.now(),
                      locale: LocaleType.en,
                    );
                    print(
                      DateTime(
                        date.year,
                        date.month,
                        date.day,
                        time.hour,
                        time.minute,
                      ),
                    );
                  }*/
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 3.0)
      ],
    );
  }
}
