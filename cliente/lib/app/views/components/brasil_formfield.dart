import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'your_icons/your_icons_icons.dart';

class TextFormFieldBrasil extends StatefulWidget {
  final String hintText;
  final TextInputFormatter? formatter;
  final YourIcons yourIcons;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? onlyNumber;
  final bool? obscureText;

  const TextFormFieldBrasil({
    super.key,
    required this.hintText,
    this.formatter,
    required this.yourIcons,
    this.controller,
    this.validator,
    this.keyboardType,
    this.onlyNumber,
    this.obscureText,
  });

  @override
  State<TextFormFieldBrasil> createState() => _TextFormFieldBrasilState();
}

class _TextFormFieldBrasilState extends State<TextFormFieldBrasil> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText ?? false,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 5.0),
          child: YourIcon(widget.yourIcons),
        ),
      ),
      inputFormatters: widget.formatter == null
          ? []
          : [
              widget.onlyNumber == true
                  ? FilteringTextInputFormatter.digitsOnly
                  : FilteringTextInputFormatter.allow(
                      RegExp('.*'),
                    ),
              widget.formatter!,
            ],
      validator: widget.validator,
    );
  }
}
