import 'package:flutter/material.dart';
import './tooth_dialog.dart';

class TeethButton extends StatefulWidget {
  @required
  final double left;
  @required
  final double top;
  @required
  final String name;
  const TeethButton(this.left, this.top, this.name);
  @override
  _TeethButtonState createState() => _TeethButtonState();
}

class _TeethButtonState extends State<TeethButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: this.widget.left,
        top: this.widget.top,
        child: InkResponse(
          onTap: () {
            return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ToothDialog(toothName: this.widget.name.toUpperCase());
                });
          },
          child: Image.asset(
            'assets/images/teeth${this.widget.name}_blank.png',
            width: 55,
            height: 55,
          ),
        ));
  }
}
