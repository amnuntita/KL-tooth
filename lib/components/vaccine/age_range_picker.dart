import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/vaccine/value_object/age_range.dart';

class AgeRangePicker extends StatefulWidget {
  final List<AgeRange> items;

  const AgeRangePicker({
    Key key,
    this.items,
  })  : assert(items != null),
        super(key: key);

  @override
  _AgeRangePickerState createState() => _AgeRangePickerState();
}

class _AgeRangePickerState extends State<AgeRangePicker> {
  AgeRange selectedValue;

  @override
  Widget build(BuildContext context) {
    selectedValue = selectedValue == null ? widget.items.first : selectedValue;

    return Container(
      padding: EdgeInsets.only(top: 16.0),
      child: Row(
        children: <Widget>[
          Text(
            'ช่วงอายุ',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                selectedValue == null ? 'ช่วงอายุ' : selectedValue.toString(),
                style: Theme.of(context).textTheme.headline2,
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox.expand(
                      child: ListView(
                        padding: EdgeInsets.all(18.0),
                        shrinkWrap: true,
                        children: <Widget>[
                          Text('ช่วงอายุ: '),
                          ListView.builder(
                            itemCount: widget.items.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: Text(widget.items[index].toString(),
                                    style:
                                        Theme.of(context).textTheme.bodyText2),
                                onTap: () {
                                  setState(() {
                                    selectedValue = widget.items[index];
                                  });
                                  Navigator.of(context).pop();
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
