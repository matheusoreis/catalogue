import 'package:cached_network_image/cached_network_image.dart';
import 'package:catalogue/app/views/components/loading_dots/loading_dots.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../controller/state/introduction/entry_state.dart';
import '../../../store/introduction/entry_controller.dart';
import '../../../../shared/api_url.dart';
import '../../../../shared/dependecy.dart';
import '../../../../shared/themes/colors.dart';
import '../../../components/buttons/button.dart';
import '../../../components/texts.dart';
import '../../../components/on_error.dart';
import '../../../components/on_loading.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  EntryController entryController = getIt<EntryController>();

  @override
  void initState() {
    super.initState();

    entryController.getEntry(context);
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    double maxWidth = mediaQuery.width;
    double maxHeight = mediaQuery.height;

    return Scaffold(
      body: ScopedBuilder<EntryController, EntryState>(
        store: entryController,
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
          var indexEntryModel = state.entry!.items[0];

          return Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: maxWidth,
                  child: CachedNetworkImage(
                    imageUrl:
                        '$apiURL/api/files/${indexEntryModel.collectionId}/${indexEntryModel.id}/${indexEntryModel.background}',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: HeadlineLarge(
                        text: indexEntryModel.welcomeMessage,
                        isBold: true,
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: SizedBox(
                            width: maxWidth,
                            child: Button(
                              text: indexEntryModel.loginAccountButton,
                              onPressed: () {
                                entryController.goToLoginPage(context: context);
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: maxWidth,
                          child: Button(
                            text: indexEntryModel.createAccountButton,
                            color: grayColor500,
                            onPressed: () {
                              entryController.goToSignUpPage(context: context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
