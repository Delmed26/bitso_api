import 'package:flutter/material.dart';

class ConversionWidget extends StatelessWidget {

  final String from;
  final String to;

  const ConversionWidget(this.from, this.to);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: from.toUpperCase()),
          const WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Icon(Icons.arrow_right_alt_rounded)
          ),
          TextSpan(text: to.toUpperCase())
        ]
      ),
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}