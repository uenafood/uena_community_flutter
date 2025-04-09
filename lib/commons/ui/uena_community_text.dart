import 'package:flutter/material.dart';

class UenaCommunityText extends StatelessWidget {
  final String title;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final double? height;
  final TextAlign? alignment;
  final bool isItalic;

  const UenaCommunityText(
    this.title, {
    super.key,
    this.color,
    this.size,
    this.weight,
    this.height,
    this.alignment,
    this.isItalic = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: alignment,
      style: TextStyle(
        fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: height,
      ),
    );
  }
}
