import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';

import '../../models/appointment/event_model.dart';
import '../../providers/theme_provider.dart';
import '../../themes/app_themes.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final _formKey = GlobalKey<FormState>();

  DateTime _currentDate = DateTime.now();
  String _currentMonth = DateFormat.yMMMM().format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();
  List<Event> _selectedDayEvents = [];
  CalendarCarousel _calendarCorousel;

  final formController = TextEditingController();

  static Widget _eventIcon = Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(1000),
      border: Border.all(color: Colors.blue, width: 2.0),
    ),
    child: Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  EventList<Event> _markedDateMap = EventList<Event>(
    events: {
      DateTime(2020, 6, 30): [
        Event(
          date: DateTime(2020, 6, 30, 12, 0),
          title: 'Hello World Event 1',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.red,
            height: 5.0,
            width: 5.0,
          ),
        ),
        Event(
          date: DateTime(2020, 6, 30, 17, 30),
          title: 'Event 2',
          icon: _eventIcon,
        ),
        Event(
          date: DateTime(2020, 6, 30, 19, 45),
          title: 'Event 3',
          icon: _eventIcon,
        ),
      ],
    },
  );

  Widget _buildEventCard(BuildContext context, Event event) {
    return GestureDetector(
      onTap: () async {
        await _showEditDialog(
          context: context,
          event: event,
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${event?.title}\n'
            'วันที่ ${DateFormat.yMMMMEEEEd().format(event?.date).toString()}\n'
            'นัดหมาย ${event?.note ?? ""}\n'
            'เวลา ${DateFormat.Hm().format(event?.date).toString()}\n'
            'สถานที่ ${event?.location ?? ""}',
            softWrap: true,
            style: Theme.of(context).textTheme.bodyText2.copyWith(height: 1.0),
          ),
        ),
      ),
    );
  }

  Future _showEditDialog({BuildContext context, Event event}) {
    return showDialog(
      context: context,
      // barrierDismissible: false,
      useRootNavigator: true,
      builder: (context) {
        return Dialog(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 600.0),
            child: Container(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ...[
                          {'label': 'Event Title', 'value': event.title},
                          {'label': 'Note', 'value': event.note},
                          {'label': 'Location', 'value': event.location},
                        ]
                            .map(
                              (item) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(item['label'] ?? 'Loading...',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1),
                                  TextFormField(
                                    initialValue: item['value'] ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .apply(fontSizeDelta: 8.0),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                ],
                              ),
                            )
                            .toList(),
                        ...[].map(
                          (item) => Column(
                            children: <Widget>[
                              Text('Label',
                                  style: Theme.of(context).textTheme.headline1),
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Checkbox(
                              value: true,
                              onChanged: (bool value) {
                                print('check box was click!');
                              },
                              checkColor: Theme.of(context).primaryColor,
                              activeColor: Colors.grey[800],
                            ),
                            Text(
                              'ตั้งการแจ้งเตือน',
                              style: Theme.of(context).textTheme.bodyText2,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              onPressed: () {},
                              color: Colors.green[400],
                              child: Text('Save'),
                            ),
                            SizedBox(
                              width: 24.0,
                            ),
                            RaisedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              color: Colors.red[400],
                              child: Text('Cancel'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = context.watch<ThemeProvider>();

    _calendarCorousel = CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        print('day was press');
        setState(() {
          _currentDate = date;
          _selectedDayEvents = events;
        });
      },
      height: 400.0,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      selectedDateTime: _currentDate,
      markedDatesMap: _markedDateMap,
      markedDateShowIcon: true,
      markedDateIconMaxShown: 2,
      markedDateIconBuilder: (event) => event.icon,
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      daysHaveCircularBorder: true,
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          // _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
    );

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(child: _calendarCorousel),
              if (_selectedDayEvents.isNotEmpty)
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: _selectedDayEvents.length,
                      itemBuilder: (context, index) => ListTile(
                        title: ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: 200.0),
                          child: _buildEventCard(
                            context,
                            _selectedDayEvents[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          themeProvider.setTheme(AppTheme.AppoimentTheme);
        },
        elevation: 2.0,
        tooltip: 'add event',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        shape: CircularNotchedRectangle(),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
