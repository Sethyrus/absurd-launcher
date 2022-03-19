import 'package:flutter/material.dart';

enum TxSize { xl, l, xm, m, s, xs }

enum TxColor {
  black,
  white,
}

enum TxWeight { normal, semiBold, bold }

class Tx extends StatelessWidget {
  static const Map<TxSize, double> _sizes = {
    TxSize.xl: 24,
    TxSize.l: 20,
    TxSize.xm: 16,
    TxSize.m: 14,
    TxSize.s: 12,
    TxSize.xs: 10,
  };

  static const Map<TxColor, Color> _colors = {
    TxColor.black: Colors.black,
    TxColor.white: Colors.white,
  };

  static const Map<TxWeight, FontWeight> _weights = {
    TxWeight.normal: FontWeight.normal,
    TxWeight.semiBold: FontWeight.w500,
    TxWeight.bold: FontWeight.bold,
  };

  final String data;
  final TxSize size;
  final TxSize? minSize;
  final TxColor color;
  final TxWeight weight;
  final bool italic;
  final bool underline;
  final bool centerText;
  final int? maxLines;

  const Tx(
    this.data, {
    Key? key,
    this.size = TxSize.m,
    this.minSize,
    this.color = TxColor.black,
    this.weight = TxWeight.normal,
    this.italic = false,
    this.underline = false,
    this.centerText = false,
    this.maxLines = 1,
  }) : super(key: key);

  double get getSize => _sizes[size]!;
  double get getMinSize => _sizes[minSize] ?? _sizes[size]!;
  Color get getColor => _colors[color]!;
  FontWeight get getFontWeight => _weights[weight]!;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: centerText ? TextAlign.center : null,
      style: TextStyle(
        fontSize: getSize,
        color: getColor,
        fontWeight: getFontWeight,
        fontStyle: italic ? FontStyle.italic : null,
        decoration: underline ? TextDecoration.underline : null,
      ),
    );
  }
}
