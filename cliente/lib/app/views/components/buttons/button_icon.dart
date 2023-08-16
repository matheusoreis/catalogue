import 'package:flutter/material.dart';

import '../../../shared/themes/colors.dart';
import '../texts.dart';
import '../your_icons/your_icons_icons.dart';

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    required this.icon,
  });

  final Function()? onPressed;
  final String text;
  final Color? color;
  final YourIcons icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
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
      icon: YourIcon(icon),
      label: BodyLarge(
        text: text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
