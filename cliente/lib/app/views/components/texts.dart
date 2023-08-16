import 'package:flutter/material.dart';

// Headline Large
class HeadlineLarge extends StatelessWidget {
  const HeadlineLarge({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.fontWeight = FontWeight.normal,
    this.isUpperCase = false,
    this.isBold = false,
    this.color,
  });

  final String text;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final bool? isUpperCase;
  final bool? isBold;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      isUpperCase! ? text.toUpperCase() : text,
      style: TextStyle(
        fontSize: 32.0,
        fontWeight: isBold! ? FontWeight.bold : FontWeight.normal,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}

// Headline Medium
class HeadlineMedium extends StatelessWidget {
  const HeadlineMedium({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.fontWeight = FontWeight.normal,
    this.isUpperCase = false,
    this.isBold = false,
    this.color,
  });

  final String text;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final bool? isUpperCase;
  final bool? isBold;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      isUpperCase! ? text.toUpperCase() : text,
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: isBold! ? FontWeight.bold : FontWeight.normal,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}

// Headline Small
class HeadlineSmall extends StatelessWidget {
  const HeadlineSmall({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.fontWeight = FontWeight.normal,
    this.isUpperCase = false,
    this.isBold = false,
    this.color,
  });

  final String text;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final bool? isUpperCase;
  final bool? isBold;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      isUpperCase! ? text.toUpperCase() : text,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: isBold! ? FontWeight.bold : FontWeight.normal,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}

// Body Large
class BodyLarge extends StatelessWidget {
  const BodyLarge({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.fontWeight = FontWeight.normal,
    this.isUpperCase = false,
    this.isBold = false,
    this.color,
  });

  final String text;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final bool? isUpperCase;
  final bool? isBold;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      isUpperCase! ? text.toUpperCase() : text,
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: isBold! ? FontWeight.bold : FontWeight.normal,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}

// Body Medium
class BodyMedium extends StatelessWidget {
  const BodyMedium({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.fontWeight = FontWeight.normal,
    this.isUpperCase = false,
    this.isBold = false,
    this.color,
  });

  final String text;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final bool? isUpperCase;
  final bool? isBold;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      isUpperCase! ? text.toUpperCase() : text,
      style: TextStyle(
        fontSize: 14.0,
        fontWeight: isBold! ? FontWeight.bold : FontWeight.normal,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}

// Body Small
class BodySmall extends StatelessWidget {
  const BodySmall({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.fontWeight = FontWeight.normal,
    this.isUpperCase = false,
    this.isBold = false,
    this.color,
  });

  final String text;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final bool? isUpperCase;
  final bool? isBold;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      isUpperCase! ? text.toUpperCase() : text,
      style: TextStyle(
        fontSize: 12.0,
        fontWeight: isBold! ? FontWeight.bold : FontWeight.normal,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}

// Sub Text
class Sub extends StatelessWidget {
  const Sub({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.fontWeight = FontWeight.normal,
    this.isUpperCase = false,
    this.isBold = false,
    this.color,
  });

  final String text;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final bool? isUpperCase;
  final bool? isBold;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      isUpperCase! ? text.toUpperCase() : text,
      style: TextStyle(
        fontSize: 10.0,
        fontWeight: isBold! ? FontWeight.bold : FontWeight.normal,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}
