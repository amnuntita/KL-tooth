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
  int statusImg = 0;
  @override
  Widget build(BuildContext context) {
    List<String> teethStatus = [
      '_blank',
      '',
      '_caries',
      '_none',
      '_gray',
      '_redcross'
    ];
    return Positioned(
        left: this.widget.left,
        top: this.widget.top - 12,
        child: InkResponse(
          onTap: () {
            return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ToothDialog(
                    toothName: this.widget.name.toUpperCase(),
                    onChange: (int val) {
                      print(val);
                      setState(() {
                        statusImg = val + 1;
                      });
                    },
                  );
                });
          },
          child: Image.asset(
            'assets/images/teeth${this.widget.name}${teethStatus[statusImg]}.png',
            width: 55,
            height: 55,
          ),
        ));
  }
}
