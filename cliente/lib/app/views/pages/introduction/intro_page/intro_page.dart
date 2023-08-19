import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../controller/state/introduction/intro_state.dart';
import '../../../../shared/api_url.dart';
import '../../../../shared/dependecy.dart';
import '../../../../shared/themes/colors.dart';
import '../../../components/buttons/button.dart';
import '../../../components/loading_dots/loading_dots.dart';
import '../../../components/on_error.dart';
import '../../../components/on_loading.dart';
import '../../../components/texts.dart';
import '../../../store/introduction/intro_controller.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  IntroController introController = getIt<IntroController>();

  int currentPage = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: currentPage,
    );

    introController.getIntro(context);
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    double maxWidth = mediaQuery.width;
    double maxHeight = mediaQuery.height;

    return Scaffold(
      body: ScopedBuilder<IntroController, IntroState>(
        store: introController,
        onLoading: (context) {
          return OnLoading(
            maxHeight: maxHeight,
            colorInLight: lightTextColor,
            colorInDark: darkTextColor,
          );
        },
        onError: (context, error) {
          return const OnError(
            error: null,
          );
        },
        onState: (context, state) {
          return PageView.builder(
            itemCount: state.intro.items.length,
            controller: pageController,
            itemBuilder: (context, index) {
              var indexIntroModel = state.intro.items[index];

              final String urlImg =
                  '$apiURL/api/files/${indexIntroModel.collectionId}/${indexIntroModel.id}/${indexIntroModel.background}';

              return SizedBox(
                width: maxWidth,
                height: maxHeight,
                child: Column(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: maxWidth,
                        child: CachedNetworkImage(
                          imageUrl: urlImg,
                          fit: BoxFit.cover,
                          placeholder: (context, url) {
                            return DotsLoading(
                              color: primary500,
                              size: 30.0,
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 30,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: HeadlineLarge(
                              text: indexIntroModel.title,
                              textAlign: TextAlign.start,
                              isBold: true,
                            ),
                          ),
                          SizedBox(
                            width: maxWidth,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 30.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(
                                      state.intro.items.length,
                                      (indexDots) {
                                        return Padding(
                                          padding: const EdgeInsets.only(left: 10.0),
                                          child: CircleAvatar(
                                            maxRadius: 5,
                                            backgroundColor: index == indexDots ? primary500 : primary100,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: maxWidth,
                                  child: Button(
                                    text: indexIntroModel.button,
                                    onPressed: () {
                                      int newIndex = index + 1;

                                      if (state.intro.items.length == newIndex) {
                                        introController.goToEntryPage(context: context);
                                      } else {
                                        introController.nextPage(pageController: pageController);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
