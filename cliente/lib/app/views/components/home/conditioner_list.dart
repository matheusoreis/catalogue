import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:go_router/go_router.dart';

import '../../../controller/state/home/conditioner/conditioner_state.dart';
import '../../../models/home/conditioner/conditioners_model.dart';
import '../../../shared/api_url.dart';
import '../../../shared/themes/colors.dart';
import '../../store/home/conditioner/conditioner_controller.dart';
import '../../store/home/home_controller.dart';
import '../loading_dots/loading_dots.dart';
import '../texts.dart';

class ConditionerList extends StatefulWidget {
  const ConditionerList({
    super.key,
    required this.homeController,
    required this.maxWidth,
    required this.maxHeight,
  });

  final HomeController homeController;
  final double maxWidth;
  final double maxHeight;

  @override
  State<ConditionerList> createState() => _ConditionerListState();
}

class _ConditionerListState extends State<ConditionerList> {
  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<ConditionerController, ConditionerState>(
      store: widget.homeController.conditionerController,
      onLoading: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadlineMedium(text: 'Destaques'),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: SizedBox(
                height: 400,
                width: widget.maxWidth,
                child: ListView.separated(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 300,
                      height: widget.maxHeight,
                      decoration: BoxDecoration(
                        color: widget.homeController.themeController.colorTheme(
                          colorInLight: grayColor,
                          colorInDark: grayColor400,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: DotsLoading(
                        color: primary500,
                        size: 30.0,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 10.0,
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
      onState: (context, state) {
        List<ConditionerModelItems> conditionerItems = state.conditioner.items;

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadlineMedium(text: 'Destaques'),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: SizedBox(
                height: 400,
                width: widget.maxWidth,
                child: ListView.separated(
                  itemCount: conditionerItems.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    ConditionerModelItems conditionerIndex = conditionerItems[index];

                    String modelCollection = conditionerIndex.collectionId;
                    String mopdelId = conditionerIndex.id;
                    String modelImage = conditionerIndex.image;

                    final String urlImg = '$apiURL/api/files/$modelCollection/$mopdelId/$modelImage';

                    return InkWell(
                      borderRadius: BorderRadius.circular(30.0),
                      onTap: () {
                        GoRouter.of(context).push('/conditioner', extra: conditionerIndex);
                      },
                      child: Container(
                        width: 300,
                        height: widget.maxHeight,
                        decoration: BoxDecoration(
                          color: primary500,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 20.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: widget.maxWidth,
                                  child: CachedNetworkImage(
                                    imageUrl: urlImg,
                                    fit: BoxFit.contain,
                                    alignment: Alignment.center,
                                    placeholder: (context, url) {
                                      return DotsLoading(
                                        color: primary500,
                                        size: 30.0,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              HeadlineMedium(
                                text: conditionerIndex.model,
                                color: Colors.white,
                              ),
                              HeadlineSmall(
                                text: conditionerIndex.name,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: SizedBox(
                                  width: widget.maxWidth,
                                  height: 33,
                                  child: ListView.separated(
                                    itemCount: conditionerIndex.exit.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: primary300,
                                          borderRadius: BorderRadius.circular(
                                            50.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0,
                                            vertical: 5.0,
                                          ),
                                          child: BodyMedium(
                                            text: conditionerIndex.exit[index],
                                            color: Colors.white,
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(width: 5.0);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 10.0,
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
