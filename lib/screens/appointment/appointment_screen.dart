import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:khunlook/components/date_time_picker_form_field.dart';
import 'package:khunlook/components/note_form_field.dart';
import 'package:khunlook/components/text_form_field.dart';
import 'package:khunlook/screens/appointment/widgets/event_card.dart';

import '../../models/appointment/event_model.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final _formKey = GlobalKey<FormState>();

  DateTime _selectedDate = DateTime.now();
  String _selectedMonth = DateFormat.yMMMM().format(DateTime.now());
  List<Event> _selectedDayEvents = [];
  DateTime _targetDateTime = DateTime(2021, 5, 13);
  CalendarCarousel _calendarCorousel;

  EventList<Event> _markedDateMap;

  @override
  void initState() {
    super.initState();
    _markedDateMap = EventList<Event>(
      events: {
        DateTime(2020, 7, 3): [
          Event(
            date: DateTime(2020, 7, 3, 12, 0),
            title: 'Hello World Event 1',
          ),
          Event(
            date: DateTime(2020, 7, 3, 17, 30),
            title: 'Event 2',
          ),
          Event(
            date: DateTime(2020, 7, 3, 19, 45),
            title: 'Event 3',
          ),
        ],
      },
    );
  }

  Future _showEditDialog({BuildContext context, Event event}) {
    final format = DateFormat('EEEE, MMMM d, y HH:mm');

    return showDialog(
      context: context,
      useRootNavigator: true,
      builder: (context) {
        return Dialog(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 600.0),
            child: GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AppTextFormField(
                          label: 'ชื่อการนัดหมาย',
                          initialValue: event?.title ?? 'Untitle',
                        ),
                        AppNoteFormField(
                          label: 'บันทึก',
                          initialValue: event?.note ?? '',
                        ),
                        AppTextFormField(
                          label: 'สถานที่นัดหมาย',
                          initialValue: event?.location ?? '',
                        ),
                        AppDateTimePickerFormField(
                          label: 'Start Date',
                          format: format,
                        ),
                        AppDateTimePickerFormField(
                          label: 'End Date',
                          format: format,
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
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              color: Colors.red[400],
                              child: Text('Cancel'),
                            ),
                            SizedBox(
                              width: 24.0,
                            ),
                            RaisedButton(
                              onPressed: () {
                                setState(() {
                                  _formKey.currentState.reset();
                                });
                              },
                              color: Colors.green[400],
                              child: Text('Save'),
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
    final calendarHeight = MediaQuery.of(context).size.width; // 1 : 1

    _calendarCorousel = CalendarCarousel<Event>(
      pageScrollPhysics: ScrollPhysics(),
      onDayPressed: (DateTime date, List<Event> events) {
        setState(() {
          _selectedDate = date;
          _selectedDayEvents = events;
        });
      },
      onDayLongPressed: (_) {
        // do nothing...
      },
      headerTextStyle:
          Theme.of(context).textTheme.headline1.apply(fontSizeDelta: 2.0),
      headerTitleTouchable: true,
      onHeaderTitlePressed: () async {
        DateTime selected = await DatePicker.showDatePicker(
          context,
          showTitleActions: true,
          currentTime: _selectedDate,
          locale: LocaleType.th,
        );
        if (selected != null) {
          setState(() {
            _selectedDate = selected;
            _selectedDayEvents = _markedDateMap.getEvents(selected);
          });
        }
      },
      leftButtonIcon: Icon(
        Icons.arrow_back_ios,
        color: Theme.of(context).primaryColorDark,
      ),
      rightButtonIcon: Icon(
        Icons.arrow_forward_ios,
        color: Theme.of(context).primaryColorDark,
      ),
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      selectedDateTime: _selectedDate,
      selectedDayButtonColor: Colors.orange[400],
      markedDatesMap: _markedDateMap,
      markedDateCustomTextStyle: Theme.of(context).textTheme.bodyText1,
      markedDateMoreShowTotal: true,
      markedDateWidget: Container(
        margin: EdgeInsets.symmetric(horizontal: 1.0),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(1000),
        ),
        height: 4.0,
        width: 4.0,
      ),
      todayButtonColor: Colors.green[400],
      todayTextStyle:
          Theme.of(context).textTheme.bodyText2.apply(color: Colors.white),
      minSelectedDate: _selectedDate.subtract(Duration(days: 360)),
      maxSelectedDate: _selectedDate.add(Duration(days: 360)),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _selectedMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      locale: 'th',
    );

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: calendarHeight,
                  ),
                  child: Container(child: _calendarCorousel)),
              Expanded(
                child: _selectedDayEvents.isNotEmpty
                    ? Container(
                        child: ListView.builder(
                          itemCount: _selectedDayEvents.length,
                          itemBuilder: (context, index) => ListTile(
                            onTap: () async {
                              await _showEditDialog(
                                context: context,
                                event: _selectedDayEvents[index],
                              );
                            },
                            dense: true,
                            title: ConstrainedBox(
                              constraints: BoxConstraints(maxHeight: 200.0),
                              child: EventCard(
                                event: _selectedDayEvents[index],
                              ),
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: Text(
                          'No Event',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 2.0,
        tooltip: 'add event',
        child: Icon(
          Icons.add,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: kBottomNavigationBarHeight,
        ),
        shape: CircularNotchedRectangle(),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
