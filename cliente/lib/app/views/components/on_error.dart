import 'package:flutter/material.dart';

import '../../shared/themes/colors.dart';
import 'loading_dots/loading_dots.dart';
import 'texts.dart';

class OnError extends StatelessWidget {
  const OnError({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const HeadlineSmall(
          text: 'Erro na conexão com o servidor...',
        ),
        DotsLoading(
          color: primary500,
          size: 30.0,
        ),
      ],
    );
  }
}
