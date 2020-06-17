import 'package:flutter/material.dart';

import '../../components/common/header_with_image.dart';
import '../../components/common/top_bar.dart';
import '../../components/vaccine/age_range_picker.dart';
import '../../components/vaccine/vaccine_grid_view.dart';
import '../../models/vaccine/value_object/age_range.dart';

class VaccineView extends StatefulWidget {
  @override
  _VaccineViewState createState() => _VaccineViewState();
}

class _VaccineViewState extends State<VaccineView> {
  List<int> essentialVaccineList = List<int>.generate(7, (index) => index);
  List<int> additionalVaccineList = List<int>.generate(6, (index) => index);
  List<AgeRange> ageRanges = List<AgeRange>.generate(
    10,
    (index) => AgeRange(
      text: 'Hello Yay! $index',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            print('menu was passed');
          },
          icon: Icon(Icons.menu),
          color: Colors.black,
        ),
        centerTitle: true,
        title: FlatButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 30.0,
                child: Image.asset(
                  'assets/images/child_memo.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                'Khunlook',
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              print('help was pressed');
            },
            icon: Icon(Icons.help_outline),
            color: Colors.black,
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TopBar(),
            Divider(
              height: 1.0,
              thickness: 1.0,
              color: Colors.black12,
            ),
            AgeRangePicker(items: ageRanges),
            Expanded(
              child: Container(
                child: ListView(
                  children: <Widget>[
                    // Essentail Vaccine
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: HeaderWithImage(
                            color: Theme.of(context).primaryColor,
                            title: Text('วัคซีนจำเป็น',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(color: Color(0xFFB98E1E))
                                    .apply(fontSizeDelta: 5.0)),
                            image: Image.asset(
                              'assets/images/vaccine_syringe.png',
                              width: 50.0,
                            ),
                          ),
                        ),
                        VaccineGridView(
                          items: essentialVaccineList,
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 16.0,
                    ),
                    // Additional Vaccine
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            children: <Widget>[
                              HeaderWithImage(
                                color: Theme.of(context).accentColor,
                                title: Text('วัคซีนเสริมหรือทดแทน',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        .copyWith(color: Color(0xFFB98E1E))
                                        .apply(fontSizeDelta: 5.0)),
                                image: Image.asset(
                                  'assets/images/vaccine_bear.png',
                                  width: 60.0,
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              IconButton(
                                onPressed: () {},
                                iconSize: 40.0,
                                icon: Icon(
                                  Icons.add_circle_outline,
                                  color: Color(0xFFDFAE2E),
                                ),
                              ),
                            ],
                          ),
                        ),
                        VaccineGridView(
                          items: additionalVaccineList,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
