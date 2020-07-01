import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart' hide Event;

class Event implements EventInterface, KhunlookEventInterface {
  final DateTime date;
  final String title;
  final Widget icon;
  final Widget dot;
  final String note;
  final String location;
  Event({
    this.date,
    this.title,
    this.icon,
    this.dot,
    this.note,
    this.location,
  });

  Event copyWith({
    DateTime date,
    String title,
    Widget icon,
    Widget dot,
    String note,
    String location,
  }) {
    return Event(
      date: date ?? this.date,
      title: title ?? this.title,
      icon: icon ?? this.icon,
      dot: dot ?? this.dot,
      note: note ?? this.note,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date?.millisecondsSinceEpoch,
      'title': title,
      'note': note,
      'location': location,
    };
  }

  static Event fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Event(
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      title: map['title'],
      note: map['note'],
      location: map['location'],
    );
  }

  String toJson() => json.encode(toMap());

  static Event fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Event(date: $date, title: $title, icon: $icon, dot: $dot, note: $note, location: $location)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Event &&
        o.date == date &&
        o.title == title &&
        o.icon == icon &&
        o.dot == dot &&
        o.note == note &&
        o.location == location;
  }

  @override
  int get hashCode {
    return date.hashCode ^
        title.hashCode ^
        icon.hashCode ^
        dot.hashCode ^
        note.hashCode ^
        location.hashCode;
  }

  @override
  DateTime getDate() {
    return date;
  }

  @override
  Widget getDot() {
    return dot;
  }

  @override
  Widget getIcon() {
    return icon;
  }

  @override
  String getLocation() {
    return location;
  }

  @override
  String getNote() {
    return note;
  }

  @override
  String getTitle() {
    return title;
  }
}

abstract class KhunlookEventInterface {
  String getNote();
  String getLocation();
}
