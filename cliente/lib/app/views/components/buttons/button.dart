import 'package:flutter/material.dart';

import '../../../shared/themes/colors.dart';
import '../texts.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
  });

  final Function()? onPressed;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: color == null
            ? MaterialStateColor.resolveWith((states) => darkRed500)
            : MaterialStateColor.resolveWith((states) => color!),
        minimumSize: MaterialStateProperty.resolveWith(
          (states) => const Size.fromHeight(60.0),
        ),
        maximumSize: MaterialStateProperty.resolveWith(
          (states) => const Size.fromHeight(60.0),
        ),
      ),
      child: BodyLarge(
        text: text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
