import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:go_router/go_router.dart';

import '../../../../controller/state/home/about/about_state.dart';
import '../../../../shared/api_url.dart';
import '../../../../shared/dependecy.dart';
import '../../../../shared/themes/colors.dart';
import '../../../components/loading_dots/loading_dots.dart';
import '../../../components/texts.dart';
import '../../../store/home/about/about_controller.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  AboutController aboutController = getIt<AboutController>();

  @override
  void initState() {
    super.initState();

    aboutController.getAbout(context);
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    double maxWidth = mediaQuery.width;
    // double maxHeight = mediaQuery.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: HeadlineMedium(
              text: 'Sobre',
            ),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                ),
              );
            },
          ),
        ),
      ),
      body: ScopedBuilder<AboutController, AboutState>(
        store: aboutController,
        onLoading: (context) {
          return Center(
            child: DotsLoading(
              color: darkRed500,
              size: 30.0,
            ),
          );
        },
        onState: (context, state) {
          var aboutIndex = state.about.items[0];

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: ListView(
              children: [
                SizedBox(
                  height: 280,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    child: CachedNetworkImage(
                      imageUrl:
                          '$apiURL/api/files/${aboutIndex.collectionId}/${aboutIndex.id}/${aboutIndex.background}',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10.0,
                    top: 20.0,
                  ),
                  child: HeadlineMedium(text: aboutIndex.title),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        height: 5,
                        color: darkRed500,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: SizedBox(
                    width: maxWidth,
                    child: BodyLarge(
                      text: aboutIndex.description,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
