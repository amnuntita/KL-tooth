import 'package:flutter/material.dart';
import './picker.dart';

class PickerFormField extends StatelessWidget {
  final String label;
  final String initialValue;
  final String hintText;
  final Picker picker;

  const PickerFormField({
    Key key,
    @required this.label,
    this.hintText,
    this.initialValue,
    @required this.picker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller =
        TextEditingController(text: initialValue);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              margin: EdgeInsets.symmetric(vertical: 5.0),
              color: Colors.grey[100],
              width: 200,
              height: 20.0,
              child: TextFormField(
                controller: _controller,
                readOnly: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: InputBorder.none,
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return picker;
                      });
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 3.0),
      ],
    );
  }
}
