import 'package:flutter/material.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  final Color? color;
  final double? size;
  final double? fontSize;
  const IconAndTextWidget(
      {Key? key,
      required this.icon,
      required this.iconColor,
      required this.text,
      this.size,
      this.color,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: size,
          color: iconColor,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: TextStyle(fontSize: fontSize),
        ),
      ],
    );
  }
}
