import 'package:flutter/material.dart';

class Comman_Text extends StatelessWidget {
  const Comman_Text({
    Key? key,
    this.text,
    this.color,
    this.fontsize,
    this.fontweight,
    this.decoration,
    this.fontFamily,
    this.maxLines,
    this.overflow,
  }) : super(key: key);

  final text;
  final color;
  final decoration;
  final double? fontsize;
  final FontWeight? fontweight;
  final String? fontFamily;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        decoration: decoration,
        color: color,
        fontSize: fontsize,
        fontWeight: fontweight,
        fontFamily: fontFamily,
      ),
    );
  }
}
