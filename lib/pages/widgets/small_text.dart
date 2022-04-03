import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? height;
  final double? size;

  const SmallText(
      {Key? key, required this.text, this.color, this.height, this.size = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: FontWeight.w400,
          height: height),
    );
  }
}
