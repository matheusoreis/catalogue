import 'package:flutter/material.dart';

import 'texts.dart';

class MyAlertModal {
  final BuildContext context;
  final String title;
  final String content;
  final List<Widget>? button;

  MyAlertModal({
    required this.context,
    required this.title,
    required this.content,
    required this.button,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: HeadlineMedium(
              text: title,
              textAlign: TextAlign.center,
            ),
          ),
          content: BodyLarge(
            text: content,
            textAlign: TextAlign.center,
          ),
          actions: button,
        );
      },
    );
  }
}
