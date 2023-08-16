import '../../../../models/home/about/about_model.dart';

abstract class AboutState {
  AboutModelData get about;
}

class SuccessAboutState extends AboutState {
  @override
  final AboutModelData about;

  SuccessAboutState({
    required this.about,
  });
}
