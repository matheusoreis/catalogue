import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:go_router/go_router.dart';

import '../../../controller/state/home/blog/blog_state.dart';
import '../../../models/home/blog/blog_model.dart';
import '../../../shared/api_url.dart';
import '../../../shared/dependecy.dart';
import '../../../shared/themes/colors.dart';
import '../../store/home/blog/blog_controller.dart';
import '../../store/theme/theme_controller.dart';
import '../loading_dots/loading_dots.dart';
import '../texts.dart';

class BlogList extends StatefulWidget {
  const BlogList({
    super.key,
    required this.blogController,
    required this.maxWidth,
    required this.maxHeight,
    required this.scrollDirection,
    this.separatorWidth = 0,
    this.separatorHeight = 0,
  });

  final BlogController blogController;
  final double maxWidth;
  final double maxHeight;
  final double separatorWidth;
  final double separatorHeight;
  final Axis scrollDirection;

  @override
  State<BlogList> createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  ThemeController themeController = getIt<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<BlogController, BlogState>(
      store: widget.blogController,
      onLoading: (context) {
        return SizedBox(
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
                  color: themeController.colorTheme(
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
              return SizedBox(
                width: widget.separatorWidth,
                height: widget.separatorHeight,
              );
            },
          ),
        );
      },
      onState: (context, state) {
        List<BlogModelItems> blogItems = state.blog.items;

        return ListView.separated(
          itemCount: blogItems.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: const EdgeInsets.only(
            bottom: 20.0,
          ),
          itemBuilder: (context, index) {
            BlogModelItems blogIndex = blogItems[index];

            String modelCollection = blogIndex.collectionId;
            String mopdelId = blogIndex.id;
            String modelImage = blogIndex.background;

            final String urlImg = '$apiURL/api/files/$modelCollection/$mopdelId/$modelImage';

            return InkWell(
              borderRadius: BorderRadius.circular(30.0),
              onTap: () {
                GoRouter.of(context).push('/blog', extra: blogIndex);
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: widget.maxWidth,
                      height: 300,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: urlImg,
                          alignment: Alignment.center,
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
                        horizontal: 20.0,
                        vertical: 20.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeadlineSmall(
                            text: blogIndex.title.length <= 40
                                ? blogIndex.title
                                : "${blogIndex.title.substring(0, 40)}...",
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: BodyLarge(
                              text: blogIndex.description.length <= 50
                                  ? blogIndex.description
                                  : '${blogIndex.description.substring(0, 50)}...',
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 10.0,
            );
          },
        );
      },
    );
  }
}
