// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'other_widget.dart';

class ColumIcon extends StatelessWidget {
  ColumIcon({
    Key? key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(
          width: 5,
        ),
        Text(text, style: textStyle14(),)
      ],
    );
  }
}
