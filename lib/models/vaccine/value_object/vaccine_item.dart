class VaccineItem {
  final String _name;

  const VaccineItem(this._name) : assert(_name != null && _name != '');

  String get name => _name;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is VaccineItem && o._name == _name;
  }

  @override
  int get hashCode => _name.hashCode;
}
