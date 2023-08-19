import 'package:catalogue/app/shared/dependecy.dart';
import 'package:catalogue/app/views/store/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../shared/themes/colors.dart';
import 'loading_dots/loading_dots.dart';

class OnLoading extends StatefulWidget {
  const OnLoading({
    super.key,
    required this.maxHeight,
    required this.colorInLight,
    required this.colorInDark,
  });

  final double maxHeight;
  final Color colorInLight;
  final Color colorInDark;

  @override
  State<OnLoading> createState() => _OnLoadingState();
}

class _OnLoadingState extends State<OnLoading> {
  ThemeController themeController = getIt<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ScopedBuilder<ThemeController, ThemeMode>(
          store: themeController,
          onState: (context, state) {
            return SvgPicture.asset(
              'assets/img/logo.svg',
              height: widget.maxHeight / 6,
              colorFilter: ColorFilter.mode(
                themeController.colorTheme(
                  colorInLight: widget.colorInLight,
                  colorInDark: widget.colorInDark,
                ),
                BlendMode.srcIn,
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: DotsLoading(
            color: primary500,
            size: 30.0,
          ),
        ),
      ],
    );
  }
}
