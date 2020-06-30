import 'package:flutter/material.dart';
import 'package:khunlook/models/appointment/event_model.dart';
import 'package:intl/intl.dart' show DateFormat;

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventTitle = event?.title;
    final eventDate = DateFormat.yMMMMEEEEd().format(event?.date).toString();
    final eventTime = DateFormat.Hm().format(event?.date).toString();
    final eventNote = event?.note ?? '';
    final eventLocation = event?.location ?? '';

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        border:
            Border.all(color: Theme.of(context).primaryColorDark, width: 5.0),
        borderRadius: BorderRadius.circular(4.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(4.0, 4.0),
            blurRadius: 4.0,
            spreadRadius: 0.2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          '$eventTitle \n'
          'วันที่ $eventDate \n'
          'นัดหมาย $eventNote \n'
          'เวลา $eventTime \n'
          'สถานที่ $eventLocation',
          softWrap: true,
          style: Theme.of(context).textTheme.bodyText2.copyWith(height: 1.0),
        ),
      ),
    );
  }
}
