import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? textStyle;
  final double spacing;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    this.textStyle,
    this.spacing = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveTextStyle = textStyle ?? const TextStyle(fontSize: 16);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
        SizedBox(
          width: 100, 
          child: Text(
            label,
            style: effectiveTextStyle,
          ),
        ),
        Text(":", style: effectiveTextStyle),
        SizedBox(width: spacing),
        Expanded(
          child: Text(
            value,
            style: effectiveTextStyle,
          ),
        ),
      ],
    );
  }
}