import 'package:flutter/material.dart';

class HeaderWithImage extends StatelessWidget {
  final Widget title;
  final Image image;
  final Color color;
  const HeaderWithImage({
    Key key,
    this.title,
    this.image,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(999.0),
          ),
          child: title,
        ),
        Positioned(
          right: -image.width / 2,
          child: image != null ? image : Container(),
        ),
      ],
    );
  }
}
