import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../shared/themes/colors.dart';
import 'loading_dots/loading_dots.dart';

class OnLoading extends StatelessWidget {
  const OnLoading({
    super.key,
    required this.maxHeight,
    required this.color,
  });

  final double maxHeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/img/logo_white.svg',
          height: maxHeight / 13,
          colorFilter: ColorFilter.mode(
            color,
            BlendMode.srcIn,
          ),
        ),
        DotsLoading(
          color: primary500,
          size: 30.0,
        ),
      ],
    );
  }
}
