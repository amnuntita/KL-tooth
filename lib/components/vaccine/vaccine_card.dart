import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VaccineCard extends StatefulWidget {
  final String name;
  final String description;

  const VaccineCard({Key key, this.name, this.description}) : super(key: key);

  @override
  _VaccineCardState createState() => _VaccineCardState();
}

class _VaccineCardState extends State<VaccineCard> {
  bool _cardValue = false;

  Future<void> _showDeleteDialog({Function acceptAction}) {
    if (Platform.isAndroid) {
      return showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'ลบข้อมูล',
                style: Theme.of(context).textTheme.headline6,
              ),
              content: Text(
                'ต้อวการลบข้อมูลใช่หรือไม่?',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('NO'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text('YES'),
                  onPressed: () {
                    acceptAction();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    } else {
      if (Platform.isIOS) {
        return showCupertinoDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                title: Text(
                  'ลบข้อมูล',
                  style: Theme.of(context).textTheme.headline6,
                ),
                content: Text(
                  'ต้อวการลบข้อมูลใช่หรือไม่?',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('NO'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text('YES'),
                    onPressed: () {
                      acceptAction();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      }
    }
    throw Error();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        color: Theme.of(context).primaryColor,
        margin: EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Switch(
              inactiveTrackColor: Colors.grey[400],
              activeColor: Colors.blueAccent,
              value: _cardValue,
              onChanged: (value) {
                print(value);
                if (value == true) {
                  setState(() {
                    _cardValue = value;
                  });
                } else {
                  _showDeleteDialog(
                    acceptAction: () => setState(() {
                      _cardValue = value;
                    }),
                  );
                }
              },
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      '${widget.name}\n${widget.description}',
                      style: Theme.of(context).textTheme.headline2.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      softWrap: true,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SizedBox(
                        width: 30.0,
                        height: 30.0,
                        child: IconButton(
                          alignment: Alignment.center,
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          splashColor: Theme.of(context).primaryColor,
                          icon: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Container(
                                width: 20.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFB98E1E),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Icon(
                                Icons.info,
                                size: 30.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
