import 'package:flutter/material.dart';
import 'edit_tooth_dialog.dart';

class ToothCard extends StatefulWidget {
  final String toothName;
  final String date;
  final String event;

  const ToothCard(
    this.toothName,
    this.date,
    this.event,
  );
  @override
  _ToothCardState createState() => _ToothCardState();
}

class _ToothCardState extends State<ToothCard> {
  String date;
  String event;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(date ?? this.widget.date),
                SizedBox(
                  width: 40,
                ),
                Text(event ?? this.widget.event),
              ],
            ),
            InkResponse(
                onTap: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return (EditToothDialog(
                        toothName: this.widget.toothName,
                        date: this.widget.date,
                        event: this.widget.event,
                        onCardChange: (List<String> val) {
                          setState(() {
                            date = val[0];
                            event = val[1];
                          });
                        },
                      ));
                    }),
                child: Icon(
                  Icons.edit,
                  size: 20,
                ))
          ],
        ),
      ),
    );
  }
}
