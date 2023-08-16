import '../../../models/introduction/intro.dart';

abstract interface class IntroState {
  IntroModelData get intro;
}

class SuccessIntroState extends IntroState {
  @override
  final IntroModelData intro;

  SuccessIntroState({
    required this.intro,
  });
}
