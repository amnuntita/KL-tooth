import 'package:flutter/material.dart';

class AppNoteFormField extends StatelessWidget {
  final String label;
  final String initialValue;
  final String hintText;

  const AppNoteFormField({
    Key key,
    @required this.label,
    this.hintText,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          label ?? 'Loading...',
          style: Theme.of(context).textTheme.headline1,
        ),
        TextFormField(
          initialValue: initialValue ?? '',
          style:
              Theme.of(context).textTheme.bodyText2.apply(fontSizeDelta: 8.0),
          decoration: InputDecoration(
            isDense: true,
            border: OutlineInputBorder(),
            hintText: hintText ?? null,
          ),
          keyboardType: TextInputType.multiline,
          maxLines: null,
        ),
        SizedBox(height: 8.0),
      ],
    );
  }
}
