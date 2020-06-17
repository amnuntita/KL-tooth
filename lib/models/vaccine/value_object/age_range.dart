class AgeRange {
  final String text;
  DateTime _start;
  DateTime _end;

  AgeRange({
    this.text,
  });

  DateTime get start => _start;
  DateTime get end => _end;

  @override
  String toString() {
    return text;
  }
}
