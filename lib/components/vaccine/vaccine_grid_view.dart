import 'package:flutter/material.dart';
import 'package:khunlook/components/vaccine/vaccine_card.dart';

class VaccineGridView extends StatelessWidget {
  final List<int> items;

  const VaccineGridView({
    Key key,
    this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        items.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'แรกเกิด',
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .apply(color: Color(0xFFDFAE2E)),
                  ),
                  Divider(
                    color: Colors.black12,
                  ),
                  GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 2.5 / 1,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: items
                        .map(
                          (item) => VaccineCard(
                            name: 'ABCD $item',
                            description: 'This is a pen',
                          ),
                        )
                        .toList(),
                  ),
                ],
              )
            : IconButton(
                onPressed: () {},
                icon: Icon(Icons.add),
              ),
      ],
    );
  }
}
